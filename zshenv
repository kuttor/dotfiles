#!/usr/bin/env zsh

# Info: .zshenv
# Name: Andrew Kuttor

#============================================================================
# Shell variables
#============================================================================
export ZDOTDIR="$HOME/.zsh"
export ZPLUG_HOME="$HOME/.zplug"
export DOTFILES="$HOME/.dotfiles"
export CACHE_DIR="$HOME/.cache"
[[ ! -d "${CACHE_DIR}" ]] && mkdir -p "${CACHE_DIR}"

#============================================================================
# Path & Fpath
#============================================================================
# typeset -U path
# path=("$HOME/bin" /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin $path)

# fpath=("$ZDOTDIR/functions" "$ZDOTDIR/completions" $fpath)

#============================================================================
# Defaults: editor, lang, pager, etc...
#============================================================================

# Editor: VIM
export EDITOR="`which vim`"

# ZLE: Vi Mode
bindkey -v

# Pager: Lessplug
export PAGER="less -R"

# Lang: English UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
setopt BANG_HIST              # '!' specially treated
setopt EXTENDED_HISTORY       # "start;elapsed;command" format
setopt INC_APPEND_HISTORY     # Write immediately to file
setopt SHARE_HISTORY          # All sessions share history
setopt HIST_EXPIRE_DUPS_FIRST # Duplicate entries expire first
setopt HIST_IGNORE_DUPS       # Don't record dupes
setopt HIST_IGNORE_ALL_DUPS   # If dupe, delete older entry
setopt HIST_FIND_NO_DUPS      # Do not display dupes
setopt HIST_IGNORE_SPACE      # Exclude entries started with space
setopt HIST_SAVE_NO_DUPS      # Dupes don't write to file
setopt HIST_REDUCE_BLANKS     # Remove blanks before being written
setopt HIST_VERIFY            # Don't execute immediately
setopt HIST_BEEP              # Beep!

# Easier alias
alias h="history"

# File path
HISTFILE=~/.zsh_history

# Max file size
HISTSIZE=1000000

SAVEHIST=5000
READNULLCMD=less
