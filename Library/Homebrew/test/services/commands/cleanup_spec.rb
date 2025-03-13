# frozen_string_literal: true

require "services/commands/cleanup"
require "services/system"
require "services/cli"

RSpec.describe Services::Commands::Cleanup do
  describe "#TRIGGERS" do
    it "contains all restart triggers" do
      expect(described_class::TRIGGERS).to eq(%w[cleanup clean cl rm])
    end
  end

  describe "#run" do
    it "root - prints on empty cleanup" do
      expect(Services::System).to receive(:root?).once.and_return(true)
      expect(Services::Cli).to receive(:kill_orphaned_services).once.and_return([])
      expect(Services::Cli).to receive(:remove_unused_service_files).once.and_return([])

      expect do
        described_class.run
      end.to output("All root services OK, nothing cleaned...\n").to_stdout
    end

    it "user - prints on empty cleanup" do
      expect(Services::System).to receive(:root?).once.and_return(false)
      expect(Services::Cli).to receive(:kill_orphaned_services).once.and_return([])
      expect(Services::Cli).to receive(:remove_unused_service_files).once.and_return([])

      expect do
        described_class.run
      end.to output("All user-space services OK, nothing cleaned...\n").to_stdout
    end

    it "prints nothing on cleanup" do
      expect(Services::System).not_to receive(:root?)
      expect(Services::Cli).to receive(:kill_orphaned_services).once.and_return(["a"])
      expect(Services::Cli).to receive(:remove_unused_service_files).once.and_return(["b"])

      expect do
        described_class.run
      end.not_to output("All user-space services OK, nothing cleaned...\n").to_stdout
    end
  end
end
