#!/usr/bin/env zsh
#vim:set filetype=zsh syntax=zsh
#shellcheck shell=zsh

export ABBR_AUTOLOAD=1
export ABBR_DEBUG=1
export ABBR_DEBUG_VERBOSE=1
export ABBR_USER_ABBREVIATIONS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/zsh-abbr/user-abbreviations"
export ABBR_SOURCE_PATH="${XDG_CONFIG_HOME:-${HOME}}/.local/share/zinit/polaris/bin/abbr"
