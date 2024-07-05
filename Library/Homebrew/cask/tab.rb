# typed: true
# frozen_string_literal: true

require "tab"

module Cask
  class Tab < ::AbstractTab
    attr_accessor :uninstall_flight_blocks, :uninstall_artifacts

    # Instantiates a {Tab} for a new installation of a cask.
    def self.create(cask)
      tab = super

      tab.tabfile = cask.metadata_main_container_path/FILENAME
      tab.uninstall_flight_blocks = cask.uninstall_flight_blocks?
      tab.runtime_dependencies = Tab.runtime_deps_hash(cask, cask.depends_on)
      tab.source["version"] = cask.version.to_s
      tab.source["path"] = cask.sourcefile_path.to_s
      tab.uninstall_artifacts = cask.artifacts_list(uninstall_only: true)

      tab
    end

    # Returns a {Tab} for an already installed cask,
    # or a fake one if the cask is not installed.
    def self.for_cask(cask)
      path = cask.metadata_main_container_path/FILENAME

      return from_file(path) if path.exist?

      tab = empty
      tab.source = {
        "path"         => cask.sourcefile_path.to_s,
        "tap"          => cask.tap&.name,
        "tap_git_head" => tap_git_head(cask),
        "version"      => cask.version.to_s,
      }
      tab.uninstall_artifacts = cask.artifacts_list(uninstall_only: true)

      tab
    end

    def self.empty
      tab = super
      tab.uninstall_flight_blocks = false
      tab.uninstall_artifacts = []
      tab.source["version"] = nil

      tab
    end

    def self.runtime_deps_hash(cask, depends_on)
      mappable_types = [:cask, :formula]
      depends_on.to_h do |type, deps|
        next [type, deps] unless mappable_types.include? type

        deps = deps.map do |dep|
          if type == :cask
            c = CaskLoader.load(dep)
            {
              "full_name"         => c.full_name,
              "version"           => c.version.to_s,
              "declared_directly" => cask.depends_on.cask.include?(dep),
            }
          elsif type == :formula
            f = Formulary.factory(dep, warn: false)
            {
              "full_name"         => f.full_name,
              "version"           => f.version.to_s,
              "revision"          => f.revision,
              "pkg_version"       => f.pkg_version.to_s,
              "declared_directly" => cask.depends_on.formula.include?(dep),
            }
          else
            dep
          end
        end

        [type, deps]
      end
    end

    def version
      source["version"]
    end

    def to_json(*_args)
      attributes = {
        "homebrew_version"        => homebrew_version,
        "loaded_from_api"         => loaded_from_api,
        "uninstall_flight_blocks" => uninstall_flight_blocks,
        "installed_as_dependency" => installed_as_dependency,
        "installed_on_request"    => installed_on_request,
        "time"                    => time,
        "runtime_dependencies"    => runtime_dependencies,
        "source"                  => source,
        "arch"                    => arch,
        "uninstall_artifacts"     => uninstall_artifacts,
        "built_on"                => built_on,
      }

      JSON.pretty_generate(attributes)
    end

    def to_s
      s = ["Installed"]
      s << "using the formulae.brew.sh API" if loaded_from_api
      s << Time.at(time).strftime("on %Y-%m-%d at %H:%M:%S") if time
      s.join(" ")
    end
  end
end
