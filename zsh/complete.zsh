#!/usr/bin/env zsh

#--------------------------------------------------------------------#
# File: Complete.zsh                                                     #
#                                                                    #
# Usage: Source file for Zsh Completions                             #
#                                                                    #
# Author: Andrew Kuttor                                              #
#--------------------------------------------------------------------#

# Enable completions
zmodload zsh/complist
autoload -Uz compinit && compinit

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' list-dirs-first yes

# SSH config
[ -f "$HOME/.ssh/config"  ] && {
    hosts=($(egrep '^Host ' "$HOME/.ssh/config" | grep -v '*' | awk '{print $2}' ));
    zstyle ':completion:*:hosts' hosts $hosts}

# AWS CLI
aws_completer="$HOME/.local/bin/aws_zsh_completer.sh"
[ -f "${aws_completer}"  ] && source $aws_completer;
