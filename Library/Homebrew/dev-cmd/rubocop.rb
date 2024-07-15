# typed: strict
# frozen_string_literal: true

require "abstract_command"

module Homebrew
  module Cmd
    class Rubocop < AbstractCommand
      cmd_args do
        description <<~EOS
          Installs, configures and runs Homebrew's `rubocop`.
        EOS
      end

      sig { override.void }
      def run = raise_sh_command_error!
    end
  end
end
