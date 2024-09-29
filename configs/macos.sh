#! /bin/bash
#  term-based auto-config for macos

boot-finder="killall Finder" 


# ============================================================================= 
# -- finder -------------------------------------------------------------------
# =============================================================================

# show full path in finder title bar
 defaults write com.apple.finder _FXShowPosixPathInTitle -bool TRUE


# =============================================================================
# -- quicklook ----------------------------------------------------------------
# ============================================================================= 

# enable text selection in quicklook
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finderx