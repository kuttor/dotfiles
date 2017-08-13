#!/bin/bash

# Author: Andrew Kuttor
# E-mail: andrew.kuttor@gmail.com

#===============================================================================
# Main
#===============================================================================

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

#===============================================================================
# Networking
#===============================================================================

alias opensockets='sudo lsof -i -P'              # Open sockets
alias openudp='sudo lsof -nP | grep UDP'     # Open UDP sockets
alias opentcp='sudo lsof -nP | grep TCP'     # Open TCP sockets
alias showlistening='sudo lsof -i | grep LISTEN'    # Listening Connections
alias ports='netstat -lantip'

#=============================================================================
# Pacman 
#=============================================================================

alias p='sudo pacman'
alias pu='sudo pacman -Syu'
alias pa='sudo pacman -Sy'
alias pq='sudo pacman -Q'
