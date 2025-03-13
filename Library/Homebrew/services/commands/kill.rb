# typed: strict
# frozen_string_literal: true

module Services
  module Commands
    module Kill
      TRIGGERS = %w[kill k].freeze

      sig { params(targets: T::Array[Services::FormulaWrapper], verbose: T.nilable(T::Boolean)).void }
      def self.run(targets, verbose:)
        Services::Cli.check(targets)
        Services::Cli.kill(targets, verbose:)
      end
    end
  end
end
