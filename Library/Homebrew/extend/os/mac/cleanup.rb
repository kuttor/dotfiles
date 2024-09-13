# typed: strict
# frozen_string_literal: true

module Homebrew
  module OS
    module MacOS
      module Cleanup
        sig { returns(T::Boolean) }
        def use_system_ruby?
          return false if Homebrew::EnvConfig.force_vendor_ruby?

          Homebrew::EnvConfig.developer? && ENV["HOMEBREW_USE_RUBY_FROM_PATH"].present?
        end
      end
    end
  end
end

Homebrew::Cleanup.prepend(Homebrew::OS::MacOS::Cleanup)
