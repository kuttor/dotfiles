# frozen_string_literal: true

require "utils"

RSpec.describe Cask::Info, :cask do
  before do
    # Prevent unnecessary network requests in `Utils::Analytics.cask_output`
    ENV["HOMEBREW_NO_ANALYTICS"] = "1"
  end

  it "displays some nice info about the specified Cask" do
    expect do
      described_class.info(Cask::CaskLoader.load("local-transmission"))
    end.to output(<<~EOS).to_stdout
      ==> local-transmission: 2.61
      https://transmissionbt.com/
      Not installed
      From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/l/local-transmission.rb
      ==> Name
      Transmission
      ==> Description
      BitTorrent client
      ==> Artifacts
      Transmission.app (App)
    EOS
  end

  it "prints auto_updates if the Cask has `auto_updates true`" do
    expect do
      described_class.info(Cask::CaskLoader.load("with-auto-updates"))
    end.to output(<<~EOS).to_stdout
      ==> with-auto-updates: 1.0 (auto_updates)
      https://brew.sh/autoupdates
      Not installed
      From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/w/with-auto-updates.rb
      ==> Name
      AutoUpdates
      ==> Description
      None
      ==> Artifacts
      AutoUpdates.app (App)
    EOS
  end

  it "prints caveats if the Cask provided one" do
    expect do
      described_class.info(Cask::CaskLoader.load("with-caveats"))
    end.to output(<<~EOS).to_stdout
      ==> with-caveats: 1.2.3
      https://brew.sh/
      Not installed
      From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/w/with-caveats.rb
      ==> Name
      None
      ==> Description
      None
      ==> Artifacts
      Caffeine.app (App)
      ==> Caveats
      Here are some things you might want to know.

      Cask token: with-caveats

      Custom text via puts followed by DSL-generated text:
      To use with-caveats, you may need to add the /custom/path/bin directory
      to your PATH environment variable, e.g. (for Bash shell):
        export PATH=/custom/path/bin:"$PATH"

    EOS
  end

  it 'does not print "Caveats" section divider if the caveats block has no output' do
    expect do
      described_class.info(Cask::CaskLoader.load("with-conditional-caveats"))
    end.to output(<<~EOS).to_stdout
      ==> with-conditional-caveats: 1.2.3
      https://brew.sh/
      Not installed
      From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/w/with-conditional-caveats.rb
      ==> Name
      None
      ==> Description
      None
      ==> Artifacts
      Caffeine.app (App)
    EOS
  end

  it "prints languages specified in the Cask" do
    expect do
      described_class.info(Cask::CaskLoader.load("with-languages"))
    end.to output(<<~EOS).to_stdout
      ==> with-languages: 1.2.3
      https://brew.sh/
      Not installed
      From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/w/with-languages.rb
      ==> Name
      None
      ==> Description
      None
      ==> Languages
      zh, en-US
      ==> Artifacts
      Caffeine.app (App)
    EOS
  end

  it 'does not print "Languages" section divider if the languages block has no output' do
    expect do
      described_class.info(Cask::CaskLoader.load("without-languages"))
    end.to output(<<~EOS).to_stdout
      ==> without-languages: 1.2.3
      https://brew.sh/
      Not installed
      From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/w/without-languages.rb
      ==> Name
      None
      ==> Description
      None
      ==> Artifacts
      Caffeine.app (App)
    EOS
  end

  it "prints install information for an installed Cask" do
    cask = Cask::CaskLoader.load("local-transmission")
    time = 1_720_189_863
    tab = Cask::Tab.new(loaded_from_api: true, tabfile: TEST_FIXTURE_DIR/"cask_receipt.json", time:)
    expect(cask).to receive(:installed?).and_return(true)
    expect(cask).to receive(:installed_version).and_return("2.61")
    expect(Cask::Tab).to receive(:for_cask).with(cask).and_return(tab)

    expect do
      described_class.info(cask)
    end.to output(<<~EOS).to_stdout
      ==> local-transmission: 2.61
      https://transmissionbt.com/
      Installed
      #{HOMEBREW_PREFIX}/Caskroom/local-transmission/2.61 (does not exist)
        Installed using the formulae.brew.sh API on #{Time.at(time).strftime("%Y-%m-%d at %H:%M:%S")}
      From: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/l/local-transmission.rb
      ==> Name
      Transmission
      ==> Description
      BitTorrent client
      ==> Artifacts
      Transmission.app (App)
    EOS
  end
end
