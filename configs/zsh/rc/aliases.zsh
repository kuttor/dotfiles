#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh

# Check if the "check" command exists and autoload all the functions in the functions directory located in ".dotfiles" if not
if ! (( $+commands[check] )); then
  autoload -Uz check
fi

# Set Bat as the default cat if it exists
#if_exists bat   && \
#alias cat='bat' && \
#alias cat='c'   && \
#alias bat='b'   &&

check bat && alias cat='bat' && alias bat='b'

# MacOS specific
alias pbc="pbcopy"
alias pbp="pbpaste"

# Navigation
alias mkcd="mkdir -p $1 && cd $1"
alias fpath_list='echo "$FPATH" | tr ":" "\n"'
alias path_list='echo "$PATH" | tr ":" "\n"'

alias vim="nvim"
alias python="python3"

# ZMV
alias zcp='zmv -C'
alias zln='zmv -L'

# Zint
alias zinit=zi
