# frozen_string_literal: true

require "rubocops/no_fileutils_rmrf"

RSpec.describe RuboCop::Cop::Homebrew::NoFileutilsRmrf do
  subject(:cop) { described_class.new }

  it "registers an offense when using FileUtils.rm_rf" do
    expect_offense(<<~RUBY)
      FileUtils.rm_rf("path/to/directory")
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Homebrew/NoFileutilsRmrf: Use `FileUtils.rm_r` instead of `FileUtils.rm_rf`.
    RUBY
  end

  it "autocorrects" do
    corrected = autocorrect_source(<<~RUBY)
      FileUtils.rm_rf("path/to/directory")
    RUBY

    expect(corrected).to eq(<<~RUBY)
      FileUtils.rm_r("path/to/directory")
    RUBY
  end

  it "does not register an offense when using FileUtils.rm_r" do
    expect_no_offenses(<<~RUBY)
      FileUtils.rm_r("path/to/directory")
    RUBY
  end
end
