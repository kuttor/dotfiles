#!/bin/bash

# Author: Andrew Kuttor
# E-mail: andrew.kuttor@gmail.com

alias pip-upgrade="pip freeze --local | grep -v '^\-e' |\
  cut -d = -f 1  | xargs pip install --user"
alias fix_stty='stty sane'                # Fixes bugged up TTY's
alias path='echo $PATH | tr -s ":" "\n"'  # Pretty print $PATH
alias quit='exit'
alias which='type -all'
alias mkdir="mkdir -pv"
alias df='df -hi'
alias du='du -csh'
alias cp="cp -ri" 
alias free='free -mt'
alias rm='rm -ii'
alias diff="colordiff -ru"
alias ls="ls --color=auto"
alias ll="ls -AFoqv --group-directories-first"
alias l.="ls -d .*"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias path='echo $PATH | tr -s ":" "\n"'
alias ports='netstat -lantip'
alias sudo='sudo '
alias reload="exec $SHELL -l"
alias tclip="termux-clipboard-set"
alias tpaste="termux-clipboard-get"
alias h="history"
alias opensockets='sudo lsof -i -P'                 # Open sockets
alias openudp='sudo lsof -nP | grep UDP'            # Open UDP sockets
alias opentcp='sudo lsof -nP | grep TCP'            # Open TCP sockets
alias showlistening='sudo lsof -i | grep LISTEN'    # Listening onnections
