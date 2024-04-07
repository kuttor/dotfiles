#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

[ "command -v lsd" >/dev/null ] &&\
lsd --config-file $CONFIGS/lsd/themes/config.yaml &&\
alias l="lsd --almost-all --long"&&\
alias ls="lsd"&&\
alias la="lsd -la"&&\
alias ll="lsd -l"&&\
alias lS="lsd --oneline --classic"&&\
alias lt="ls --tree"&&\
alias lt="lsd --tree --depth=2"&&\
alias llm="lsd --timesort --long"
