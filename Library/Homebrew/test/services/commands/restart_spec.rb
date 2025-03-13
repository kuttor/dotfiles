# frozen_string_literal: true

require "services/commands/restart"
require "services/cli"
require "services/formula_wrapper"
RSpec.describe Services::Commands::Restart do
  describe "#TRIGGERS" do
    it "contains all restart triggers" do
      expect(described_class::TRIGGERS).to eq(%w[restart relaunch reload r])
    end
  end

  describe "#run" do
    it "fails with empty list" do
      expect do
        described_class.run([], verbose: false)
      end.to raise_error UsageError, "Invalid usage: Formula(e) missing, please provide a formula name or use --all"
    end

    it "starts if services are not loaded" do
      expect(Services::Cli).not_to receive(:run)
      expect(Services::Cli).not_to receive(:stop)
      expect(Services::Cli).to receive(:start).once
      service = instance_double(Services::FormulaWrapper, service_name: "name", loaded?: false)
      expect(described_class.run([service], verbose: false)).to be_nil
    end

    it "starts if services are loaded with file" do
      expect(Services::Cli).not_to receive(:run)
      expect(Services::Cli).to receive(:start).once
      expect(Services::Cli).to receive(:stop).once
      service = instance_double(Services::FormulaWrapper, service_name: "name", loaded?: true,
service_file_present?: true)
      expect(described_class.run([service], verbose: false)).to be_nil
    end

    it "runs if services are loaded without file" do
      expect(Services::Cli).not_to receive(:start)
      expect(Services::Cli).to receive(:run).once
      expect(Services::Cli).to receive(:stop).once
      service = instance_double(Services::FormulaWrapper, service_name: "name", loaded?: true,
service_file_present?: false)
      expect(described_class.run([service], verbose: false)).to be_nil
    end
  end
end
