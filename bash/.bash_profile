#!/bin/bash

# Author: Andrew Kuttor
# E-mail: andrew.kuttor@gmail.com

# If not interactive do not pass go
case $- in
    *i*) ;;
      *) return;;
esac

BASHDOTS="$HOME/.dotfiles/bash/" # Home


#-------------------------------------------------------------------------------
# BUILTINS
#-------------------------------------------------------------------------------

shopt -s autocd       # Auto cd when navigating file system
shopt -s nocaseglob   # Case in-sensitive globbing
shopt -s histappend   # Append to history
shopt -s cdspell      # Autocorrect typos in path when using cd
shopt -s checkwinsize # Checks/Modifies term window size per command


#-------------------------------------------------------------------------------
# Pretty Lights
#-------------------------------------------------------------------------------

# Detect GNU or OSX ls 
if ls --color /dev/null 2>&1
then
    colorflag="--color=auto" # GNU
else
    colorflag="-G"           # OSX
fi

eval $(dircolors -b $BASHDOTS/.dircolors) # Coloring for 300 filetypes
alias ls="ls -AFoqv --color --group-directories-first |\
  tail -n +2 && find -maxdepth 1 -type f -printf '%s\n'"


#-------------------------------------------------------------------------------
# History
#-------------------------------------------------------------------------------

export HISTSIZE='32768'           # Assign enlarged history file size to var
export HISTFILESIZE="${HISTSIZE}" # Sets new history limit
export HISTCONTROL='ignoreboth'   # No dupes, No leading spaces


#-------------------------------------------------------------------------------
# Langs
#-------------------------------------------------------------------------------

# Set English and UTF-8
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'


#-------------------------------------------------------------------------------
# Completionss
#-------------------------------------------------------------------------------

# Enable programmable completions
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#-------------------------------------------------------------------------------
# Extras
#-------------------------------------------------------------------------------

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


#-------------------------------------------------------------------------------
# Sources
#-------------------------------------------------------------------------------

# Aliases
if [ -f "$BASHDOTS/.bash_aliases" ]
then
  source "$BASHDOTS/.bash_aliases"
fi

# Functions
if [ -f "$BASHDOTS/.bash_functions" ]
then
  source "$BASHDOTS/.bash_functions"
fi



