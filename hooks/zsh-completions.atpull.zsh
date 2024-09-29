#!/usr/bin/env zsh

zinit creinstall -q .

# should be called before compinit
zmodload zsh/complist

# start the completion system 
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

# specifict the completers types
zstyle ':completion:*' completer _extensions _complete _approximate

# enable caching
zstyle ':completion:*' use-cache  true
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# file and folder colors
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# specify the desired tags for cd 
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# set how completions will be grouped
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# completion matching control
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true

# general completion options
zstyle ':completion:*' complete-options true
zstyle ':completion:*' squeeze-slashes  true
zstyle ':completion:*' always-to-end    true
zstyle ':completion:*' list-packed      true
zstyle ':completion:*' verbose          true
zstyle ':completion:*' menu             select

# ssh host completions
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts\
  'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'




compdef _gnu_generic