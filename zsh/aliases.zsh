#!/bin/bash
# ------------------------------------------------------------------------------
# Name    : aliases
# About   : Contains user aliases and functions
# Author  : Andrew Kuttor
# Contact : andrew.kuttor@gmail.com
# ------------------------------------------------------------------------------
alias ansible-create="ansible-galaxy init  --offline --force "
alias ak="tree -C"
alias cl="clear"
alias cp="cp -ri"
alias c="clear"
alias cat="bat"
alias df="df -hi"
alias diff="colordiff -ru"
alias dog="pygmentize -O style=monokai -f console256 -g"
alias du="du -csh"
alias free="free -mt"
alias g="git"
alias git-new-repo="git init && git add --all && git commit -m 'Initial Commit'"
alias h="history"
alias historysummary="history | awk '{a[\$2]++} END{for(i in a){printf \"%5d\t%s\n\",a[i],i}}' | sort -rn | head"
alias hu="h|rg "
alias mkdir="mkdir -pv"
alias molecule-create="molecule init scenario -r "
alias mtop="htop --sort-key=PERCENT_MEM"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip='ifconfig -a | perl -nle"/(\d+\.\d+\.\d+\.\d+)/ && print $1"'
alias path='echo $PATH | tr -s ":" "\n"'
alias fpath='echo $fpath | tr -s " " "\n"'
alias pcat="pygmentize -f terminal256 -O style=monokai -g"
alias ports="netstat -lantip"
alias python-library="python -c 'from distutils.sysconfig import get_python_lib; print(get_python_lib())'"
alias quit="exit"
alias reload="exec $SHELL -l"
alias set_bitbucket_user="git config user.name 'Andy Kuttor' && git config user.email 'akuttor@cis.ntt.com'"
alias stripcolors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'
alias sudo="sudo "
alias zmv="noglob zmv -W"
alias top-ten="print -l -- ${(o)history%% *} | uniq -c | sort -nr | head -n 10"
alias vim="nvim"
alias vimswap_clean="rm -rf $VIM_SWAP/*"
alias vscode_settings="$HOME/Library/Application\ Support/Code/User/settings.json"


if command -v exa >/dev/null 2>&1; then
    alias ls="exa --git --color=always --group-directories-first"
    alias ll="exa --all --long --git --color=automatic --group-directories-first"
    alias la="exa --all --binary --group --header --long --git --color=always --group-directories-first"
    alias l="exa --git --color=always --group-directories-first"
fi

# Interactive/verbose commands.
alias mv='mv -i'
for c in cp rm chmod chown rename
do
  alias $c="$c -v"
done

#alias v='vim -R -'
#for i in /usr/share/vim/vim*/macros/less.sh(N)
#do
#  alias v="$i"
#done


