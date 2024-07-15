# typed: strict
# frozen_string_literal: true

require "abstract_command"

module Homebrew
  module Cmd
    class SetupRuby < AbstractCommand
      cmd_args do
        description <<~EOS
          Installs and configures Homebrew's Ruby. If `command` is passed, it will only run Bundler if necessary for that command.
        EOS

        named_args :command
      end

      sig { override.void }
      def run = raise_sh_command_error!
    end
  end
end
