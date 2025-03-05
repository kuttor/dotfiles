# frozen_string_literal: true

require "cmd/install"
require "cmd/shared_examples/args_parse"

RSpec.describe Homebrew::Cmd::InstallCmd do
  include FileUtils
  it_behaves_like "parseable arguments"

  it "installs formulae", :integration_test do
    setup_test_formula "testball1"

    expect { brew "install", "testball1" }
      .to output(%r{#{HOMEBREW_CELLAR}/testball1/0\.1}o).to_stdout
      .and not_to_output.to_stderr
      .and be_a_success
    expect(HOMEBREW_CELLAR/"testball1/0.1/foo/test").not_to be_a_file
  end

  it "installs formulae with options", :integration_test do
    setup_test_formula "testball1"

    expect { brew "install", "testball1", "--with-foo" }
      .to output(%r{#{HOMEBREW_CELLAR}/testball1/0\.1}o).to_stdout
      .and not_to_output.to_stderr
      .and be_a_success
    expect(HOMEBREW_CELLAR/"testball1/0.1/foo/test").to be_a_file
  end

  it "can install keg-only Formulae", :integration_test do
    setup_test_formula "testball1", <<~RUBY
      version "1.0"

      keg_only "test reason"
    RUBY

    expect { brew "install", "testball1" }
      .to output(%r{#{HOMEBREW_CELLAR}/testball1/1\.0}o).to_stdout
      .and not_to_output.to_stderr
      .and be_a_success
    expect(HOMEBREW_CELLAR/"testball1/1.0/foo/test").not_to be_a_file
  end

  it "can install HEAD Formulae", :integration_test do
    repo_path = HOMEBREW_CACHE.join("repo")
    repo_path.join("bin").mkpath

    repo_path.cd do
      system "git", "-c", "init.defaultBranch=master", "init"
      system "git", "remote", "add", "origin", "https://github.com/Homebrew/homebrew-foo"
      FileUtils.touch "bin/something.bin"
      FileUtils.touch "README"
      system "git", "add", "--all"
      system "git", "commit", "-m", "Initial repo commit"
    end

    setup_test_formula "testball1", <<~RUBY
      version "1.0"

      head "file://#{repo_path}", :using => :git

      def install
        prefix.install Dir["*"]
      end
    RUBY

    # Ignore dependencies, because we'll try to resolve requirements in build.rb
    # and there will be the git requirement, but we cannot instantiate git
    # formula since we only have testball1 formula.
    expect { brew "install", "testball1", "--HEAD", "--ignore-dependencies" }
      .to output(%r{#{HOMEBREW_CELLAR}/testball1/HEAD-d5eb689}o).to_stdout
      .and output(/Cloning into/).to_stderr
      .and be_a_success
    expect(HOMEBREW_CELLAR/"testball1/HEAD-d5eb689/foo/test").not_to be_a_file
  end

  it "installs formulae with debug symbols", :integration_test do
    setup_test_formula "testball1"

    expect { brew "install", "testball1", "--debug-symbols", "--build-from-source" }
      .to output(%r{#{HOMEBREW_CELLAR}/testball1/0\.1}o).to_stdout
      .and not_to_output.to_stderr
      .and be_a_success
    expect(HOMEBREW_CELLAR/"testball1/0.1/bin/test").to be_a_file
    expect(HOMEBREW_CELLAR/"testball1/0.1/bin/test.dSYM/Contents/Resources/DWARF/test").to be_a_file if OS.mac?
    expect(HOMEBREW_CACHE/"Sources/testball1").to be_a_directory
  end

  it "installs with asking for user prompts without installed dependent checks", :integration_test do
    setup_test_formula "testball1"

    expect {
      brew "install", "--ask", "testball1"
    }.to output(/.*Formula\s*\(1\):\s*testball1.*/
             ).to_stdout.and not_to_output.to_stderr

    expect(HOMEBREW_CELLAR/"testball1/0.1/bin/test").to be_a_file
  end

  it "installs with asking for user prompts with installed dependent checks", :integration_test do
    setup_test_formula "testball1", <<~RUBY
      url "https://brew.sh/testball1-1.0"
      depends_on "testball3"
      depends_on "build" => :build
      depends_on "installed"
    RUBY
    setup_test_formula "installed"
    setup_test_formula "testball3", <<~RUBY
      url "https://brew.sh/testball3-1.0"
      depends_on "testball4"
    RUBY
    setup_test_formula "testball4", <<~RUBY
      url "https://brew.sh/testball4-1.0"
    RUBY
    setup_test_formula "hiop"
    setup_test_formula "build"

    expect {
      brew "info", "testball1"
    }.to be_a_failure

    expect {
      brew "info", "testball4"
    }.to be_a_failure

    # Mock `Formula#any_version_installed?` by creating the tab in a plausible keg directory
    keg_dir = HOMEBREW_CELLAR/"installed"/"1.0"
    keg_dir.mkpath
    touch keg_dir/AbstractTab::FILENAME
    #
    # expect { brew "deps", "baz", "--include-test", "--missing", "--skip-recommended" }
    #   .to be_a_success
    #         .and output("bar\nfoo\ntest\n").to_stdout
    #                                        .and not_to_output.to_stderr

    expect {
      brew "install", "--ask", "testball1"
    }.to output(/.*Formula\s*\(3\):\s*testball1\s*,?\s*testball3\s*,?\s*testball4.*/
             ).to_stdout.and not_to_output.to_stderr

    expect(HOMEBREW_CELLAR/"testball1/0.1/bin/test").to be_a_file
  end
end
