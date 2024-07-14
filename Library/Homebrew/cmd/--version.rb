# typed: strict
# frozen_string_literal: true

require "abstract_command"

module Homebrew
  module Cmd
    class Version < AbstractCommand
      sig { override.returns(String) }
      def self.command_name = "--version"

      cmd_args do
        description <<~EOS
          Print the version numbers of Homebrew, Homebrew/homebrew-core and
          Homebrew/homebrew-cask (if tapped) to standard output.
        EOS
      end

      sig { override.void }
      def run = raise_sh_command_error!
    end
  end
end
