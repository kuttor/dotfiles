#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------
# file: zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------
limit coredumpsize 0

# ENV VAR
ZDOTDIR="$HOME/.zsh"
export DOTFILES="$HOME/.dotfiles"
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Coloring
autoload -Uz colors && colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=9'=

# FSH
FAST_WORK_DIR="$HOME/.config/fsh"

# z.lua
eval "$(lua $ZPLUG_REPOS/skywind3000/z.lua/z.lua --init zsh)"
_ZL_CMD="y"                                                                   # command alias
_ZL_DATA="$HOME/.config/zdatafile.lua"                         # datafile location
_ZL_ECHO=1                                                                   # Echo dirname after CD.
_ZL_MATCH_MODE=1                                                    # Enable enhanced matching.

# Sources
source "$DOTFILES/aliases"
source "$DOTFILES/functions"
source "$DOTFILES/keybinds.zsh"
source "$DOTFILES/zplug.zsh"
source "$DOTFILES/completes.zsh"
source "$DOTFILES/history.zsh"
source "$DOTFILES/options.zsh"
source "$HOME/.iterm2_shell_integration.zsh"

