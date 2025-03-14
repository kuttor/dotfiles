# typed: strict
# frozen_string_literal: true

require "services/cli"

module Homebrew
  module Services
    module Commands
      module Run
        TRIGGERS = ["run"].freeze

        sig { params(targets: T::Array[Services::FormulaWrapper], verbose: T.nilable(T::Boolean)).void }
        def self.run(targets, verbose:)
          Services::Cli.check(targets)
          Services::Cli.run(targets, verbose:)
        end
      end
    end
  end
end
