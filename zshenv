#!/usr/bin/env bash

# Info: .zshenv
# Name: Andrew Kuttor

#============================================================================
# Environment Variables
#============================================================================

export DOTFILES="$HOME/.dotfiles"
export ZDOTDIR="$HOME/.dotfiles"
export ZPLUG_HOME="$HOME/.zplug"
export CACHE_DIR="$HOME/.cache"

[[ ! -d "${CACHE_DIR}" ]] && mkdir -p "${CACHE_DIR}"


#============================================================================
# Path & Fpath
#============================================================================

typeset -U path
path=("$HOME/bin" /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin $path)

# fpath=("$ZDOTDIR/functions" "$ZDOTDIR/completions" $fpath)

#============================================================================
# Defaults: editor, lang, pager, etc...
#============================================================================

# Editor: Vim
export EDITOR="`which vim`"

# Pager: Less
export PAGER="less"

# Color: 256
export TERM=xterm-256color

# Default Shell: Sh
[[ ${TERM:-dumb} != "dumb"  ]] || exec "/bin/sh"
[ -t 1  ] || exec "/bin/sh"

# Umask
umask 022

#============================================================================
# History
#============================================================================

# Builtin shell options
setopt BANG_HIST                    # '!' specially treated
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY             # "start;elapsed;command" format
setopt INC_APPEND_HISTORY           # Write immediately to file
setopt SHARE_HISTORY                # All sessions share history
setopt HIST_EXPIRE_DUPS_FIRST       # Duplicate entries expire first
setopt HIST_IGNORE_DUPS             # Don't record dupes
setopt HIST_IGNORE_ALL_DUPS         # If dupe, delete older entry
setopt HIST_FIND_NO_DUPS            # Do not display dupes
setopt HIST_IGNORE_SPACE            # Exclude entries started with space
setopt HIST_SAVE_NO_DUPS            # Dupes don't write to file
setopt HIST_REDUCE_BLANKS           # Remove blanks before being written
setopt HIST_VERIFY                  # Don't execute immediately
setopt HIST_BEEP                    # Beep!

# File path
HISTFILE=~/.zsh_history

# Max file size
HISTSIZE=1000000

SAVEHIST=5000
READNULLCMD=less


#============================================================================-
# Load the sources
#============================================================================

source "$HOME/.dotfiles/options"
source "$HOME/.dotfiles/zplug"
source "$HOME/.dotfiles/keybindings"
source "$HOME/.dotfiles/aliases_shell"
source "$HOME/.dotfiles/functions"

