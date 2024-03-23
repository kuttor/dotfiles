#! /usr/bin/env zsh

alias mkcd="mkdir -p $1 && cd $1"
alias vim="nvim"
alias fpath_list='echo "$FPATH" | tr ":" "\n"'
alias path_list='echo "$PATH" | tr ":" "\n"'

# Adds color to uncolourful commands
GRC=$(command -v grc)
if [ -n GRC ]; then
  alias colourify='$GRC -es --colour=auto'
  alias as='colourify as'
  #cvs
  alias configure='colourify ./configure'
  alias diff='colourify diff'
  alias dig='colourify dig'
  alias g++='colourify g++'
  alias gas='colourify gas'
  alias gcc='colourify gcc'
  alias head='colourify head'
  alias ifconfig='colourify ifconfig'
  #irclog
  alias ld='colourify ld'
  #ldap
  #log
  alias make='colourify make'
  alias mount='colourify mount'
  #mtr
  alias netstat='colourify netstat'
  alias ping='colourify ping'
  #proftpd
  alias ps='colourify ps'
  alias tail='colourify tail'
  alias traceroute='colourify traceroute'
  #wdiff
fi