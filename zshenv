#!/usr/bin/env zsh

# Info: zshenv - One file to source them all
# Author: Andrew Kuttor
# Contact: andrew.kuttor@gmail.com

#----------------------------------------------------------------------------
# Path & Fpath
#----------------------------------------------------------------------------

typeset -U path
path=("$HOME/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" $path)

#----------------------------------------------------------------------------
# LANGUAGE
#----------------------------------------------------------------------------

export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

#----------------------------------------------------------------------------
# Environment Variables
#----------------------------------------------------------------------------

export DOTFILES="$HOME/.dotfiles"
export ZDOTDIR="$HOME/.dotfiles"
export ZPLUG_HOME="$HOME/.zplug"
export CACHE_DIR="$HOME/.cache"

#----------------------------------------------------------------------------
# Sources
#----------------------------------------------------------------------------

# Don't source anything other than ZSHENV
unsetopt GLOBAL_RCS

source "$HOME/.dotfiles/zplug"
source "$HOME/.dotfiles/keybinds"
source "$HOME/.dotfiles/aliases"
source "$HOME/.dotfiles/functions"
source "$HOME/.dotfiles/completes"
# source "$HOME/.dotfiles/hooks"
# source "$HOME/.dotfiles/options"
