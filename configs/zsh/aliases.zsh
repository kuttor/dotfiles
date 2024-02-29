#! /usr/bin/env zsh

alias tree='tree -aC -I ".git|node_modules|bower_components" --dirsfirst "$@" | less -RNXx'

