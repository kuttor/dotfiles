#!/usr/bin/env zsh

export FZF_HELP_SYNTAX='help'

source $HOME/.local/share/fzf-help/fzf-help.zsh
zle -N fzf-help-widget
bindkey "^A" fzf-help-widget