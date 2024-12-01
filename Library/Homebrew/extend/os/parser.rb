# typed: strict
# frozen_string_literal: true

require "extend/os/linux/cli/parser" if OS.linux?

module Homebrew
  module CLI
    class Args
      sig { returns(T::Boolean) }
      def formula? = OS.linux?
    end
  end
end
