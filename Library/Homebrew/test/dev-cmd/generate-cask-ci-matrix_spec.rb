# frozen_string_literal: true

require "cmd/shared_examples/args_parse"
require "dev-cmd/generate-cask-ci-matrix"

RSpec.describe Homebrew::DevCmd::GenerateCaskCiMatrix do
  ENV["GITHUB_REPOSITORY"] = "homebrew/homebrew-cask"

  it_behaves_like "parseable arguments"

  it "fails when not from inside a tap directory", :integration_test do
    expect do
      brew "generate-cask-ci-matrix", "--cask", "google-chrome",
           "GITHUB_REPOSITORY" => ENV.fetch("GITHUB_REPOSITORY")
    end
      .to output(/Error: Invalid usage: This command must be run from inside a tap directory./).to_stderr
  end
end
