#!/usr/bin/env zsh
# -*- coding: utf-8 -*-
#vim:set filetype=zsh syntax=zsh

# eza is a maintained fork of exa (a modern ls).
LS_FLAGS="--all --group-directories-first --time-style=long-iso --sort=name --icons=always"
alias ls="eza ${LS_FLAGS} --across"
alias ll="eza ${LS_FLAGS} --long --group --header --binary --created --modified --git --classify"
alias l="ls"
alias tree="ll --tree"
