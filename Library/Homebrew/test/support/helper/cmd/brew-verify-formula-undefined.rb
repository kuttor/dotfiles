# typed: strict
# frozen_string_literal: true

require "cli/parser"

module Homebrew
  module Cmd
    class VerifyFormulaUndefined < AbstractCommand
    end
  end
end

parser = Homebrew::CLI::Parser.new(Homebrew::Cmd::VerifyFormulaUndefined) do
  usage_banner <<~EOS
    `verify-formula-undefined`

    Verifies that `require "formula"` has not been performed at startup.
  EOS
end

parser.parse

Homebrew.failed = defined?(Formula) && Formula.respond_to?(:[])
