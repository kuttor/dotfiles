#!/usr/bin/env zsh
#File: ${HOME}/.dotfiles/hooks/fast-syntax-highlighting.atinit.zsh
#VIM: set filetype=zsh syntax=zsh
#Describe: Init-Script for Fast-Syntax-Highlighting plugin

ZINIT[COMPINIT_OPTS]=-C
zicompinit
zicdreplay
