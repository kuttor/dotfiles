#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

export LSD_COMMONS="--almost-all --header --git --group-directories-first --config-file=$CONFIGS/lsd/config.yaml --icon=always --icon-theme=always --color=always --human-readable --permission=rwx
"

alias l="lsd --almost-all --long"
alias ls="lsd"
alias la="lsd -la"
alias ll="lsd -l"
alias lS="lsd --oneline --classic"
alias lt="lsd --tree --depth=2"
alias llm="lsd --timesort --long"
echo yup
