#!/usr/bin/env bash

# Author: Andrew Kuttor
# E-mail: andrew.kuttor@gmail.com

# =============================================================================
# Functions
# =============================================================================

mcd(){ mkdir -p $1 && cd $1; }                            # make/cd to folder
rsed(){ find . -type f -exec sed "$@" {} \+ ;}            # recursive sed
dug(){ dig +nocmd $1 any +multiline +noall +answer ;}     # better dig
backup(){ cp -p $@{,.backup$(date '+%Y%m%dx')} ;}         # easy backup
httpHeaders() { curl -I -L $@ ;}                         # get HTTP headers
ak(){ tree -L 1 -Ccfhau --du --dirsfirst $@ ;}            # better ls
trash() { mv $@ "$HOME/.Trash" ;}                         # easy backup
zed(){ sed -i -e "s/$1/$2/g" $3 ;}                        # easy send

# Multi-format unarchiver
extract(){
    if [ -f $1 ]; then 
        case $1 in
          *.tar.bz2)   tar xjf $1     ;;
          *.tar.gz)    tar xzf $1     ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar e $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xf $1      ;;
          *.tbz2)      tar xjf $1     ;;
          *.tgz)       tar xzf $1     ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "$1"      ;;
      esac
  else
      echo "Incompatible archive: $1"
  fi
}

# test for open ports
# usage: testPort <servername or ip> <port> <protocol>
#testPort(){
#  server=$1; port=$2; proto=${3:-tcp}
#  exec 5<>/dev/$proto/$server/$port
#  (( $? == 0 )) && exec 5<&-
#}


