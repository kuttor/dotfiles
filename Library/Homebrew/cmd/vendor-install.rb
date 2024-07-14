# typed: strict
# frozen_string_literal: true

require "abstract_command"

module Homebrew
  module Cmd
    class VendorInstall < AbstractCommand
      cmd_args do
        description <<~EOS
          Install Homebrew's portable Ruby.
        EOS

        named_args :target

        hide_from_man_page!
      end

      sig { override.void }
      def run = raise_sh_command_error!
    end
  end
end
