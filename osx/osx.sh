#!/usr/bin/env bash

# Show all files in finder
defaults write com.apple.finder AppleShowAllFiles -boolean true

# Highlight hidden apps in dock
defaults write com.apple.Dock showhidden -bool yes

# Enable Suck effect in dock
defaults write com.apple.dock mineffect -string suck

# Show full path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true










# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Restart automatically if the computer freezes
systemsetup -setrestartfreeze on

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # Dont create ds_store files on net drives
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true # Auto-open window when volume mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true # Auto-open window when volume mounted
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true  # Auto-open window when volume mounted
defaults write com.apple.frameworks.diskimages skip-verify YES # Disable disk image verifications

defaults write NSGlobalDomain com.apple.springing.delay -float 0             # Remove spring loading delay for folders
defaults write NSGlobalDomain com.apple.springing.enabled -bool true         # Spring loading for folders

# Enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Swipe between pages with three fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false

# -----------------------------------------------------------------------------
# Dialogs
# -----------------------------------------------------------------------------
defaults write NSGlobalDomain NSWindowResizeTime .1 # Increasae speed of dialog boxes
defaults write com.apple.helpviewer DevMode -bool true # Non-floating mode for help-viewer windows

# -----------------------------------------------------------------------------
# Login Window
# -----------------------------------------------------------------------------
defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName # Reveal IP address, hostname, OS version, etc in login window clock

# -----------------------------------------------------------------------------
# Display
# -----------------------------------------------------------------------------
defaults write NSGlobalDomain AppleFontSmoothing -int 2 # Enable subpixal font rendering in non-apple lcds
defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true # Enable HiDPI display modes (requires restart)
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001 # Accelerated playback when adjusting the window size (Cocoa applications).

# -----------------------------------------------------------------------------
# Keyboard
# -----------------------------------------------------------------------------
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false # Disable press-and-hold for keys in favor of key repeat
defaults write com.apple.BezelServices kDimTime -int 300 # Disable keyboard backlight after 5 minutes
defaults write NSGlobalDomain KeyRepeat -int 3 # increase keyboard repeat rate
defaults write com.apple.BezelServices kDim -bool true # enable keyboard backlight in low light
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3 # Enable full keyboard access for all controls

# -----------------------------------------------------------------------------
# Screenshots
# -----------------------------------------------------------------------------
defaults write com.apple.screencapture location -string "${HOME}/Desktop" # Save screenshots to desktop
defaults write com.apple.screencapture type -string "png" # Save screenshots in PNG format
defaults write com.apple.screencapture disable-shadow -bool true # Disable shadows in screenshots

# -----------------------------------------------------------------------------
# Mission Control
# -----------------------------------------------------------------------------
defaults write com.apple.dock expose-animation-duration -float 0.1 # Make animations faster

# -----------------------------------------------------------------------------
# Finder
# -----------------------------------------------------------------------------
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true # Display full path in finder window
defaults write com.apple.finder AppleShowAllFiles -bool true # Show hidden files
defaults write com.apple.finder DisableAllAnimations -bool true # Disable animations info window
defaults write com.apple.finder EmptyTrashSecurely -bool true # Empty Trash Securely
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # Search current folder first
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # Disable warning win changing file ext
defaults write com.apple.finder FXPreferredViewStyle -string "clmv" # Four letter view codes for Finder
defaults write com.apple.finder ShowPathbar -bool true                      # Show path bar
defaults write com.apple.finder ShowStatusBar -bool true                    # Show status bar
defaults write com.apple.LaunchServices LSQuarantine -bool false            # Disable verify opening app dialog
defaults write NSGlobalDomain AppleShowAllExtensions -bool true             # Show Extension
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true # Expand save panel
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true    # Expand print panel

# -----------------------------------------------------------------------------
# Quick Look
# -----------------------------------------------------------------------------
defaults write -g QLPanelAnimationDuration -float 0 # Disable quick look animations
defaults write com.apple.finder QLEnableTextSelection -bool true # Allow text selection in quick look

# Show extra item info next to desktop icons and other icon views
finder_path="$HOME/Library/Preferences/com.apple.finder.plist"

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" $finder_path
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" $finder_path
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" $finder_path

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" $finder_path

# Enable snap-to-grid for icons on the desktop and in other icon views
finder_path="$HOME/Library/Preferences/com.apple.finder.plist"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" $finder_path
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" $finder_path
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" $finder_path

chflags nohidden $HOME/Library # Show user Libaray folder

# -----------------------------------------------------------------------------
# Launchpad
# -----------------------------------------------------------------------------
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete # Reset Launchpad

# -----------------------------------------------------------------------------
# Desktop
# -----------------------------------------------------------------------------
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true # Show External HD on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true # Show HD on desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true # Show mounted server on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool # Show removal media on desktop

# -----------------------------------------------------------------------------
# Dashboard
# -----------------------------------------------------------------------------
defaults write com.apple.dashboard mcx-disabled -bool true # Disable dashboard
defaults write com.apple.dashboard devmode -bool true # Enable Dashboard dev mode (allows keeping widgets on the desktop)

# -----------------------------------------------------------------------------
# Dock
# -----------------------------------------------------------------------------
defaults write com.apple.Dock autohide-delay -float 0 # Disable delay when hiding dock
defaults write com.apple.dock autohide-time-modifier -float 0 # Remove animations when hide/show dock
defaults write com.apple.dock dashboard-in-overlay -bool true # Dont show dashboard as a space
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true # Spring loading for all dock items
defaults write com.apple.dock expose-animation-duration -float 0.1 # Speed up Mission Control animations
defaults write com.apple.dock mineffect suck # Use suck animation
defaults write com.apple.dock minimize-to-application -bool true # Min windows into app icon
defaults write com.apple.dock mouse-over-hilite-stack -bool true # Highlight hover effect for stack grid-view
defaults write com.apple.dock mru-spaces -bool false # Don't auto-arrange spaces by most recent
defaults write com.apple.dock no-glass -bool true # Enable 2d dock
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }' # Recents
defaults write com.apple.dock scroll-to-open -bool true # Hidden scroll gesture for dock
defaults write com.apple.dock show-process-indicators -bool true # Indicator lights for open apps
defaults write com.apple.dock showhidden -bool true # Hidden dock items translucent
defaults write com.apple.dock tilesize -int 36 # Dock icon size 36 pixals
defaults write com.apple.dock use-new-list-stack -bool YES # Enable hidden stacks list

# -----------------------------------------------------------------------------
# Email
# -----------------------------------------------------------------------------
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false # Copy addresses as `foo@example.com`
defaults write com.apple.mail DisableReplyAnimations -bool true # Disable send/receive animations
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9" # ⌘ + Enter to send an email
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes" # Enable threaded mode
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes" # Set descending order
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date" # Set old to new date

# -----------------------------------------------------------------------------
# Safari
# -----------------------------------------------------------------------------
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25 # Disable standard rengering delay
defaults write com.apple.Safari HomePage -string "about:blank" # Use about:blank as homepage
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false # Dont auto-open safe downloading files
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true # Backspace key to go back
defaults write com.apple.Safari ProxiesInBookmarksBar "()" # Remove useless icons from bookmark bar
defaults write com.apple.Safari IncludeDevelopMenu -bool true # Enable develop menu
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true # Enable webkit extras
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true # Enable webkit extras


# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable the debug menu in iCal (pre-10.8)
defaults write com.apple.iCal IncludeDebugMenu -bool true

# Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true # Enable Webkit Dev toolts
defaults write com.apple.appstore ShowDebugMenu -bool true # Enable Debug Mode

# Text Edit
defaults write com.apple.TextEdit RichText -int 0 # Use Plain text for documents
defaults write com.apple.TextEdit ShowRuler 0 # Show ruler
defaults write com.apple.TextEdit PlainTextEncoding -int 4 # Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4 # Open and save files as UTF-8 in TextEdit




