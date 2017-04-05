#!/usr/bin/env bash

# Info: .zshenv
# Name: Andrew Kuttor

#----------------------------------------------------------------------------
# Environment Variables
#----------------------------------------------------------------------------

export DOTFILES="$HOME/.dotfiles"
export ZDOTDIR="$HOME/.dotfiles"
export ZPLUG_HOME="$HOME/.zplug"
export CACHE_DIR="$HOME/.cache"


#============================================================================
# Path & Fpath
#============================================================================

typeset -U path
path=("$HOME/bin" /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin $path)

#============================================================================
# Defaults: editor, lang, pager, etc...
#============================================================================

# Editor: Vim
export EDITOR="`which vim`"

# Pager: Less
export PAGER="less"

# Default Shell: Sh
[[ ${TERM:-dumb} != "dumb"  ]] || exec "/bin/sh"
[ -t 1  ] || exec "/bin/sh"

# Umask
umask 022

#============================================================================-
# Load the sources
#============================================================================

source "$HOME/.dotfiles/zplug"
source "$HOME/.dotfiles/keybinds"
source "$HOME/.dotfiles/aliases"
source "$HOME/.dotfiles/functions"
source "$HOME/.dotfiles/history"
source "$HOME/.dotfiles/completions"
source "$HOME/.dotfiles/hooks"

# Autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=138"
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(\
    do_enter kill-line $ZSH_AUTOSUGGEST_CLEAR_WIDGETS)



# Color: 256
export TERM=xterm-256color
export CLICOLOR=YES
# alias dircolors=gdircolors
# eval $(dircolors -b "$HOME/.dircolors")


#============================================================================
# Prompt
#============================================================================

# Prompt expansions powers
setopt PROMPT_SUBST

# Load prompt
autoload -U promptinit
promptinit && prompt pure

#============================================================================
# Help
#============================================================================

# Hotkey: Meta+h for current command
autoload run-help

# Auto-Help responses
autoload run-help-sudo
autoload run-help-git
autoload run-help-openssl
autoload run-help-ip

# Enabled math functions
zmodload zsh/mathfunc


#============================================================================
# Less
#============================================================================

# Enhanced Less
export LESS='--tabs=4 --no-init --LONG-PROMPT \
    --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'

# Settings
export LESSCHARSET=utf-8
export LESSHISTSIZE=1000
