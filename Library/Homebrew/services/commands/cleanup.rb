# typed: strict
# frozen_string_literal: true

module Services
  module Commands
    module Cleanup
      TRIGGERS = %w[cleanup clean cl rm].freeze

      sig { void }
      def self.run
        cleaned = []

        cleaned += Services::Cli.kill_orphaned_services
        cleaned += Services::Cli.remove_unused_service_files

        puts "All #{System.root? ? "root" : "user-space"} services OK, nothing cleaned..." if cleaned.empty?
      end
    end
  end
end
