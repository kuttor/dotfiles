#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# file: zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

export ZDOTDIR="${${(%):-%N}:A:h}"
limit coredumpsize 0
skip_global_compinit=1
stty -ixon -ixoff

# Sources
source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/completes.zsh"
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/zplug.zsh"
dedupe_path # Remove any duplicate paths
