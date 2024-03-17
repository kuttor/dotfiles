#!/usr/bin/env bash

defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName # Reveal IP address, hostname, OS version, etc in login window clock
defaults write com.apple.addressbook ABShowDebugMenu -bool true                  # Enable the debug menu in Address Book
defaults write com.apple.BezelServices kDim -bool true                           # enable keyboard backlight in low light
defaults write com.apple.BezelServices kDimTime -int 300                         # Disable keyboard backlight after 5 minutes
defaults write com.apple.CrashReporter DialogType -string "none"                 # Disable crash reporter
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true     # Dont create ds_store files on net drives
defaults write com.apple.DiskUtility advanced-image-options -bool true           # Enable advanced image options in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true               # Enable the debug menu in Disk Utility
defaults write com.apple.dock autohide-delay -float 0                            # Disable delay when hiding dock
defaults write com.apple.dock autohide-time-modifier -float 0                    # Remove animations when hide/show dock
defaults write com.apple.dock dashboard-in-overlay -bool true                    # Dont show dashboard as a space
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true # Spring loading for all dock items
defaults write com.apple.dock expose-animation-duration -float 0.1               # Make animations faster
defaults write com.apple.dock expose-animation-duration -float 0.1               # Speed up Mission Control animations
defaults write com.apple.dock mineffect -string suck                             # Enable Suck effect in dock
defaults write com.apple.dock mineffect suck                                     # Use suck animation
defaults write com.apple.dock minimize-to-application -bool true                 # Min windows into app icon
defaults write com.apple.dock mouse-over-hilite-stack -bool true                 # Highlight hover effect for stack grid-view
defaults write com.apple.dock mru-spaces -bool false                             # Don't auto-arrange spaces by most recent
defaults write com.apple.dock no-glass -bool true                                # Enable 2d dock
defaults write com.apple.dock scroll-to-open -bool true                          # Hidden scroll gesture for dock
defaults write com.apple.dock show-process-indicators -bool true                 # Indicator lights for open apps
defaults write com.apple.dock showhidden -bool true                              # Hidden dock items translucent
defaults write com.apple.dock showhidden -bool yes                               # Highlight hidden apps in dock
defaults write com.apple.dock tilesize -int 36                                   # Dock icon size 36 pixals
defaults write com.apple.dock use-new-list-stack -bool YES                       # Enable hidden stacks list
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true               # Display full path in finder window
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true               # Show full path in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true                     # Show hidden files
defaults write com.apple.finder DisableAllAnimations -bool true                  # Disable animations info window
defaults write com.apple.finder EmptyTrashSecurely -bool true                    # Empty Trash Securely
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"              # Search current folder first
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false       # Disable warning win changing file ext
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"              # Four letter view codes for Finder
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true         # Auto-open window when volume mounted
defaults write com.apple.finder QLEnableTextSelection -bool true                 # Allow text selection in quick look
defaults write com.apple.finder ShowPathbar -bool true                           # Show path bar
defaults write com.apple.finder ShowStatusBar -bool true                         # Show status bar
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true      # Auto-open window when volume mounted
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true      # Auto-open window when volume mounted
defaults write com.apple.frameworks.diskimages skip-verify YES                   # Disable disk image verifications
defaults write com.apple.helpviewer DevMode -bool true                           # Non-floating mode for help-viewer windows
defaults write com.apple.LaunchServices LSQuarantine -bool false                 # Disable verify opening app dialog
defaults write com.apple.screencapture disable-shadow -bool true                 # Disable shadows in screenshots
defaults write com.apple.screencapture location -string "${HOME}/Desktop"        # Save screenshots to desktop
defaults write com.apple.screencapture type -string "png"                        # Save screenshots in PNG format
defaults write com.apple.TextEdit PlainTextEncoding -int 4                       # Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4               # Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit RichText -int 0                                # Use Plain text for documents
defaults write com.apple.TextEdit ShowRuler 0                                    # Show ruler
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true      # Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3                         # Enable full keyboard access for all controls
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false               # Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain AppleShowAllExtensions -bool true                  # Show Extension
defaults write NSGlobalDomain com.apple.springing.delay -float 0                 # Remove spring loading delay for folders
defaults write NSGlobalDomain com.apple.springing.enabled -bool true             # Spring loading for folders
defaults write NSGlobalDomain KeyRepeat -int 3                                   # increase keyboard repeat rate
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true      # Expand save panel
defaults write NSGlobalDomain NSWindowResizeTime .1                              # Increasae speed of dialog boxes
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true         # Expand print panel
systemsetup -setrestartfreeze on                                                 # Restart automatically if the computer freezes
