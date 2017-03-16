#!/usr/bin/env zsh

# Info: .zshenv
# Name: Andrew Kuttor

# Shell specific env vars
export ZDOTDIR="$HOME/.zsh"
export ZPLUG_HOME="$HOME/.zplug"
export DOTFILES="$HOME/.dotfiles"

# Sets Path and removes dupes
typeset -U path
path=(~/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin $path)

