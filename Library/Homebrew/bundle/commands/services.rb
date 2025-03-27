# typed: strict
# frozen_string_literal: true

require "bundle/brewfile"
require "bundle/brew_services"
require "formula"

module Homebrew
  module Bundle
    module Commands
      module Services
        sig { params(args: String, global: T::Boolean, file: T.nilable(String)).void }
        def self.run(*args, global:, file:)
          raise UsageError, "invalid `brew bundle services` arguments" if args.length != 1

          parsed_entries = Brewfile.read(global:, file:).entries

          subcommand = args.first
          case subcommand
          when "run"
            run_services(parsed_entries)
          when "stop"
            stop_services(parsed_entries)
          else
            raise UsageError, "unknown bundle services subcommand: #{subcommand}"
          end
        end

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
            service_file = Bundle::BrewServices.versioned_service_file(entry.name)

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

        sig { params(entries: T::Array[Homebrew::Bundle::Dsl::Entry], _block: T.nilable(T.proc.void)).void }
        def self.run_services(entries, &_block)
          map_entries(entries) do |info, service_file, conflicting_services|
            if info["running"] && !Bundle::BrewServices.stop(info["name"], keep: true)
              opoo "Failed to stop #{info["name"]} service"
            end

            conflicting_services.each do |conflict|
              if conflict["running"] && !Bundle::BrewServices.stop(conflict["name"], keep: true)
                opoo "Failed to stop #{conflict["name"]} service"
              end
            end

            unless Bundle::BrewServices.run(info["name"], file: service_file)
              opoo "Failed to start #{info["name"]} service"
            end

            return unless block_given?

            begin
              yield
            ensure
              stop_services(entries)

              conflicting_services.each do |conflict|
                if conflict["running"] && conflict["registered"] && !Bundle::BrewServices.run(conflict["name"])
                  opoo "Failed to restart #{conflict["name"]} service"
                end
              end
            end
          end
        end

        sig { params(entries: T::Array[Homebrew::Bundle::Dsl::Entry]).void }
        def self.stop_services(entries)
          map_entries(entries) do |info, _, _|
            next unless info["loaded"]

            # Try avoid services not started by `brew bundle services`
            next if Homebrew::Services::System.launchctl? && info["registered"]

            if info["running"] && !Bundle::BrewServices.stop(info["name"], keep: true)
              opoo "Failed to stop #{info["name"]} service"
            end
          end
        end
      end
    end
  end
end
