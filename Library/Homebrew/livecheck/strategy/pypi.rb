# typed: strict
# frozen_string_literal: true

require "json"
require "utils/curl"

module Homebrew
  module Livecheck
    module Strategy
      # The {Pypi} strategy identifies versions of software at pypi.org by
      # using the JSON API endpoint.
      #
      # PyPI URLs have a standard format:
      #
      # * `https://files.pythonhosted.org/packages/<hex>/<hex>/<long_hex>/example-1.2.3.tar.gz`
      #
      # This method uses the `info.version` field in the JSON response to
      # determine the latest stable version.
      #
      # @api public
      class Pypi
        NICE_NAME = "PyPI"

        # The `Regexp` used to extract the package name and suffix (e.g. file
        # extension) from the URL basename.
        FILENAME_REGEX = /
          (?<package_name>.+)- # The package name followed by a hyphen
          .*? # The version string
          (?<suffix>\.tar\.[a-z0-9]+|\.[a-z0-9]+)$ # Filename extension
        /ix

        # The `Regexp` used to determine if the strategy applies to the URL.
        URL_MATCH_REGEX = %r{
          ^https?://files\.pythonhosted\.org
          /packages
          (?:/[^/]+)+ # The hexadecimal paths before the filename
          /#{FILENAME_REGEX.source.strip} # The filename
        }ix

        # Whether the strategy can be applied to the provided URL.
        #
        # @param url [String] the URL to match against
        # @return [Boolean]
        sig { params(url: String).returns(T::Boolean) }
        def self.match?(url)
          URL_MATCH_REGEX.match?(url)
        end

        # Extracts the package name from the provided URL and generates the
        # PyPI JSON API endpoint.
        #
        # @param url [String] the URL used to generate values
        # @return [Hash]
        sig { params(url: String).returns(T::Hash[Symbol, T.untyped]) }
        def self.generate_input_values(url)
          values = {}

          match = File.basename(url).match(FILENAME_REGEX)
          return values if match.blank?

          package_name = T.must(match[:package_name]).gsub(/[_-]/, "-")
          values[:url] = "https://pypi.org/project/#{package_name}/#files"
          values[:regex] = %r{href=.*?/packages.*?/#{package_name}[._-]v?(\d+(?:\.\d+)*(?:[._-]post\d+)?)\.t}i

          values
        end

        # Fetches the latest version of the package from the PyPI JSON API.
        #
        # @param url [String] the URL of the content to check
        # @param regex [Regexp] a regex used for matching versions in content (optional)
        # @return [Hash]
        sig {
          params(
            url:     String,
            regex:   T.nilable(Regexp),
            _unused: T.untyped,
            _block:  T.nilable(Proc),
          ).returns(T::Hash[Symbol, T.untyped])
        }
        def self.find_versions(url:, regex: nil, **_unused, &_block)
          match_data = { matches: {}, regex:, url: }

          generated = generate_input_values(url)
          return match_data if generated.blank?

          match_data[:url] = generated[:url]

          # Parse JSON and get the latest version
          begin
            response = Utils::Curl.curl_output(generated[:url])
            data = JSON.parse(response.stdout, symbolize_names: true)
            latest_version = data.dig(:info, :version)
          rescue => e
            puts "Error fetching version from PyPI: #{e.message}"
            return {}
          end

          # Return the version if found
          return {} if latest_version.blank?

          { matches: { latest_version => Version.new(latest_version) } }
        end
      end
    end
  end
end
