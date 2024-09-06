# typed: strict
# frozen_string_literal: true

module Homebrew
  module SimulateSystemMac
    sig { returns(T::Boolean) }
    def simulating_or_running_on_macos?
      SimulateSystem.os.blank? || [:macos, *MacOSVersion::SYMBOLS.keys].include?(SimulateSystem.os)
    end

    sig { returns(Symbol) }
    def current_os
      SimulateSystem.os || MacOS.version.to_sym
    end
  end
end

Homebrew::SimulateSystem.singleton_class.prepend(Homebrew::SimulateSystemMac)
