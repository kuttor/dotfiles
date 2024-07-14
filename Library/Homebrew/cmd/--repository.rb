# typed: strict
# frozen_string_literal: true

require "abstract_command"

# This Ruby command exists to allow generation of completions for the Bash
# version.
# It is not meant to be run.
module Homebrew
  module Cmd
    class Repository < AbstractCommand
      sig { override.returns(String) }
      def self.command_name = "--repository"

      cmd_args do
        description <<~EOS
          Display where Homebrew's Git repository is located.

          If <user>`/`<repo> are provided, display where tap <user>`/`<repo>'s directory is located.
        EOS

        named_args :tap

        hide_from_man_page!
      end

      sig { override.void }
      def run
        raise StandardError,
              "This command is just here for completions generation. " \
              "It's actually defined in `cmd/--repository.sh` instead."
      end
    end
  end
end
