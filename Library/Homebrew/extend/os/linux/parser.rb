# typed: true # rubocop:todo Sorbet/StrictSigil
# frozen_string_literal: true

module Homebrew
  module CLI
    module ParserLinux
      extend T::Helpers

      requires_ancestor { Homebrew::CLI::Parser }

      sig { void }
      def set_default_options
        @args["formula?"] = true if @args.respond_to?(:formula?)
      end

      sig { void }
      def validate_options
        return unless @args.respond_to?(:cask?)
        return unless @args.cask?

        # NOTE: We don't raise an error here because we don't want
        #       to print the help page or a stack trace.
        odie "Invalid `--cask` usage: Casks do not work on Linux"
      end
    end
  end
end

Homebrew::CLI::Parser.prepend(Homebrew::CLI::ParserLinux)
