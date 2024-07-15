# typed: strict
# frozen_string_literal: true

require "abstract_command"

module Homebrew
  module Cmd
    class Formulae < AbstractCommand
      cmd_args do
        description "List all locally installable formulae including short names."
      end

      sig { override.void }
      def run = raise_sh_command_error!
    end
  end
end
