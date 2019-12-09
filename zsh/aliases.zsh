#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Name    : aliases
# About   : Contains user aliases and functions
# Author  : Andrew Kuttor
# Contact : andrew.kuttor@gmail.com
# ------------------------------------------------------------------------------
alias ak="tree -C"
alias ansible-create="ansible-galaxy init  --offline --force "
alias c="clear"
alias cat="bat"
alias cl="clear"
alias cp="cp -ri"
alias df="df -hi"
alias diff="colordiff -ru"
alias dog="pygmentize -O style=monokai -f console256 -g"
alias du="du -csh"
alias fpath='echo $fpath | tr -s " " "\n"'
alias free="free -mt"
alias g="git"
alias git-new-repo="git init && git add --all && git commit -m 'Initial Commit'"
alias h="fc -lf"
alias historysummary="history | awk '{a[\$2]++} END{for(i in a){printf \"%5d\t%s\n\",a[i],i}}' | sort -rn | head"
alias hu="h|rg "
alias l="exa -1 --color=always --group-directories-first --all"
alias ll="exa --binary --group --header --all --long --links --inode --classify --blocks --group-directories-first"
alias ls="exa --git --color=always --group-directories-first"
alias mkdir="mkdir -pv"
alias molecule-create="molecule init scenario -r "
alias mtop="htop --sort-key=PERCENT_MEM"
alias mv='mv -ip'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip='ifconfig -a | perl -nle"/(\d+\.\d+\.\d+\.\d+)/ && print $1"'
alias path='echo $PATH | tr -s ":" "\n"'
alias pcat="pygmentize -f terminal256 -O style=monokai -g"
alias pip3-unsafe-install="pip install <package name> --trusted-host pypi.org --trusted-host files.pythonhosted.org"
alias ports="netstat -lantip"
alias python-library="python -c 'from distutils.sysconfig import get_python_lib; print(get_python_lib())'"
alias quit="exit"
alias reload="exec $SHELL -l"
alias set_bitbucket_user="git config user.name 'Andy Kuttor' && git config user.email 'akuttor@cis.ntt.com'"
alias sleepoff='sudo pmset -b sleep 0; sudo pmset -b disablesleep 1'
alias sleepon='sudo pmset -b sleep 5; sudo pmset -b disablesleep 0'
alias ssh="TERM=xterm-256color ssh"
alias stripcolors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'
alias sudo="sudo "
alias tf="terraform"
alias top-ten="print -l -- ${(o)history%% *} | uniq -c | sort -nr | head -n 10"
alias vim="nvim"
alias vimswap_clean="rm -rf $VIM_SWAP/*"
alias vscode_settings="$HOME/Library/Application\ Support/Code/User/settings.json"
alias zmv="noglob zmv -W"
alias zz="z -c"
alias zi="z -i"
alias zf="z -I"
alias zb="z -b"
