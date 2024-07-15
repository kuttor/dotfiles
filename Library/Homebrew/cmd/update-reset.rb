# typed: strict
# frozen_string_literal: true

require "abstract_command"

module Homebrew
  module Cmd
    class UpdateReset < AbstractCommand
      cmd_args do
        description <<~EOS
          Fetch and reset Homebrew and all tap repositories (or any specified <repository>) using `git`(1) to their latest `origin/HEAD`.

          *Note:* this will destroy all your uncommitted or committed changes.
        EOS

        named_args :repository
      end

      sig { override.void }
      def run = raise_sh_command_error!
    end
  end
end
