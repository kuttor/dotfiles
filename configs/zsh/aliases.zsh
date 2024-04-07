#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh

# Set Bat as the default cat if it exists
#if_exists bat   && \
#alias cat='bat' && \
#alias cat='c'   && \
#alias bat='b'   &&

alias mkcd="mkdir -p $1 && cd $1"
alias vim="nvim"
alias fpath_list='echo "$FPATH" | tr ":" "\n"'
alias path_list='echo "$PATH" | tr ":" "\n"'
