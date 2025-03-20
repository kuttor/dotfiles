# typed: strict
# frozen_string_literal: true

require "bundle/dsl"
require "formula"
require "services/system"

module Homebrew
  module Bundle
    module Services
      sig {
        params(
          entries: T::Array[Homebrew::Bundle::Dsl::Entry],
          _block:  T.proc.params(
            info:                 T::Hash[String, T.anything],
            service_file:         Pathname,
            conflicting_services: T::Array[T::Hash[String, T.anything]],
          ).void,
        ).void
      }
      private_class_method def self.map_entries(entries, &_block)
        formula_versions = Bundle.formula_versions_from_env

        entries_formulae = entries.filter_map do |entry|
          next if entry.type != :brew

          formula = Formula[entry.name]
          next unless formula.any_version_installed?

          [entry, formula]
        end.to_h

        # The formula + everything that could possible conflict with the service
        names_to_query = entries_formulae.flat_map do |entry, formula|
          [
            formula.name,
            *formula.versioned_formulae_names,
            *formula.conflicts.map(&:name),
            *entry.options[:conflicts_with],
          ]
        end

        # We parse from a command invocation so that brew wrappers can invoke special actions
        # for the elevated nature of `brew services`
        services_info = JSON.parse(
          Utils.safe_popen_read(HOMEBREW_BREW_FILE, "services", "info", "--json", *names_to_query),
        )

        entries_formulae.filter_map do |entry, formula|
          version = formula_versions[entry.name.downcase]
          prefix = formula.rack/version if version

          service_file = if prefix&.directory?
            if Homebrew::Services::System.launchctl?
              prefix/"#{formula.plist_name}.plist"
            else
              prefix/"#{formula.service_name}.service"
            end
          end

          unless service_file&.file?
            prefix = formula.any_installed_prefix
            next if prefix.nil?

            service_file = if Homebrew::Services::System.launchctl?
              prefix/"#{formula.plist_name}.plist"
            else
              prefix/"#{formula.service_name}.service"
            end
          end

          next unless service_file.file?

          info = services_info.find { |candidate| candidate["name"] == formula.name }
          conflicting_services = services_info.select do |candidate|
            next unless candidate["running"]

            formula.versioned_formulae_names.include?(candidate["name"])
          end

          raise "Failed to get service info for #{entry.name}" if info.nil?

          yield info, service_file, conflicting_services
        end
      end

      sig { params(entries: T::Array[Homebrew::Bundle::Dsl::Entry]).void }
      def self.run(entries)
        map_entries(entries) do |info, service_file, conflicting_services|
          safe_system HOMEBREW_BREW_FILE, "services", "stop", "--keep", info["name"] if info["running"]
          conflicting_services.each do |conflicting_service|
            safe_system HOMEBREW_BREW_FILE, "services", "stop", "--keep", conflicting_service["name"]
          end

          safe_system HOMEBREW_BREW_FILE, "services", "run", "--file=#{service_file}", info["name"]
        end
      end

      sig { params(entries: T::Array[Homebrew::Bundle::Dsl::Entry]).void }
      def self.stop(entries)
        map_entries(entries) do |info, _, _|
          next unless info["loaded"]

          # Try avoid services not started by `brew bundle services`
          next if Homebrew::Services::System.launchctl? && info["registered"]

          safe_system HOMEBREW_BREW_FILE, "services", "stop", info["name"]
        end
      end
    end
  end
end
