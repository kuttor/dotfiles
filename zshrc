#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# file: zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com
#TRAPWINCH() { zle && { zle reset-prompt; zle -R }}
export ZSH="$HOME/.dotfiles/zsh"
limit coredumpsize 0
skip_global_compinit=1
stty -ixon -ixoff

# Sources
source "$ZSH/setopts"
source "$ZSH/zplugin"
source "$ZSH/env"
source "$ZSH/aliases"
source "$ZSH/completes"
source "$ZSH/keybind"
