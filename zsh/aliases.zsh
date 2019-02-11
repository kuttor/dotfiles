#!/bin/bash
# ------------------------------------------------------------------------------
# Name    : aliases
# About   : Contains user aliases and functions
# Author  : Andrew Kuttor
# Contact : andrew.kuttor@gmail.com
# ------------------------------------------------------------------------------
alias ansible-create="ansible-galaxy init  --offline --force "
alias ak="tree -C"
alias cp="cp -ri"
alias df="df -hi"
alias diff="colordiff -ru"
alias dog="pygmentize -O style=monokai -f console256 -g"
alias du="du -csh"
alias free="free -mt"
alias h="history"
alias hu="h|rg "
alias git-new-repo="git init && git add --all && git commit -m 'Initial Commit'"
alias mkdir="mkdir -pv"
alias molecule-create="molecule init scenario -r "
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias vimswap_clean="rm -rf $VIM_SWAP/*"
alias mtop="htop --sort-key=PERCENT_MEM"
alias path='echo $PATH | tr -s ":" "\n"'
alias pcat="pygmentize -f terminal256 -O style=monokai -g"
alias pip-upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias ports="netstat -lantip"
alias quit="exit"
alias reload="exec $SHELL -l"
alias sudo="sudo "
alias g="git"
alias top-ten="print -l -- ${(o)history%% *} | uniq -c | sort -nr | head -n 10"

# Replace 'ls' with exa if it is available.
if command -v exa >/dev/null 2>&1; then
    alias ls="exa --git --color=always --group-directories-first"
    alias ll="exa --all --long --git --color=automatic --group-directories-first"
    alias la="exa --all --binary --group --header --long --git --color=always --group-directories-first"
    alias l="exa --git --color=always --group-directories-first"
fi
