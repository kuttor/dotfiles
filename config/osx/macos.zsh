#! /usr/bin/env zsh

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
# ~ Aliases ~
alias cpwd='pwd | tr -d "\n" | pbcopy'                        # Copy the working path to clipboard
alias cl="fc -e -|pbcopy"                                     # Copy output of last command to clipboard
alias caff="caffeinate -ism"                                  # Run command without letting mac sleep
alias cleanDS="find . -type f -name '*.DS_Store' -ls -delete" # Delete .DS_Store files on Macs
alias capc="screencapture -c"
alias capic="screencapture -i -c"
alias capiwc="screencapture -i -w -c"

## SPOTLIGHT MAINTENANCE ##
alias spot-off="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spot-on="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"

# If the 'mds' process is eating tons of memory it is likely getting hung on a file.
# This will tell you which file that is.
alias spot-file="lsof -c '/mds$/'"

alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder" # Clean up LaunchServices to remove duplicates in the "Open With" menu
# ------------------------------------------------------------------------------
# ~ Mac OS X ~

CAPTURE_FOLDER="${HOME}/Desktop"

copyfile() (
  # DESC: Copy contents of a file to the clipboard
  # ARGS: 1 (Required) - Path to file

  if [ -n "$1" ] && [ -f "$1" ]; then
    pbcopy <"${1}"
    return 0
  else
    printf "File not found: %s\n" "$1"
    return 1
  fi
)

cap() {
  # DESC: Capture the screen to the desktop
  screencapture "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}

capi() {
  # DESC: Capture the selected screen area to the desktop
  screencapture -i "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}

capiw() {
  # DESC: Capture the selected window to the desktop
  screencapture -i -w "${CAPTURE_FOLDER}/capture-$(date +%Y%m%d_%H%M%S).png"
}

# Open the finder to a specified path or to current directory.
f() {
  # DESC:  Opens the Finder to specified directory. (Default is current oath)
  # ARGS:  $1 (optional): Path to open in finder
  open -a "Finder" "${1:-.}"
}

ql() {
  # DESC:  Opens files in MacOS Quicklook
  # ARGS:  $1 (optional): File to open in Quicklook
  # USAGE: ql [file1] [file2]
  qlmanage -p "${*}" &>/dev/null
}

unquarantine() {
  # DESC:  Manually remove a downloaded app or file from the MacOS quarantine
  # ARGS:  $1 (required): Path to file or app
  # USAGE: unquarantine [file]

  local attribute
  for attribute in com.apple.metadata:kMDItemDownloadedDate com.apple.metadata:kMDItemWhereFroms com.apple.quarantine; do
    xattr -r -d "${attribute}" "$@"
  done
}

browser() {
  # DESC:  Pipe HTML to a Safari browser window
  # USAGE: echo "<h1>hi mom!</h1>" | browser'

  local FILE
  FILE=$(mktemp -t browser.XXXXXX.html)
  cat /dev/stdin >|"${FILE}"
  open -a Safari "${FILE}"
}

# Search for a file using MacOS Spotlight's metadata
spotlight() {
  mdfind "kMDItemDisplayName == '${1}'wc"
}
