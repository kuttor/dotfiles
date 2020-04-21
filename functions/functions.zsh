#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Name    : functions
# About   : Extended function for dotfiles
# Author  : Andrew Kuttor
# Contact : andrew.kuttor@gmail.com
# ------------------------------------------------------------------------------

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

fzf-down() {
    fzf --height 50% "$@" --border
}

# Brew
bs() {
    local inst=$(brew search | fzf --reverse -m)

    if [[ $inst ]]; then
        for prog in $(echo $inst);
        do brew install $prog; done;
    fi
}

bu() {
    local upd=$(brew leaves | fzf --reverse -m)

    if [[ $upd ]]; then
        for prog in $(echo $upd);
        do brew upgrade $prog; done;
    fi
}

bd() {
    local uninst=$(brew leaves | fzf --reverse -m)

    if [[ $uninst ]]; then
        for prog in $(echo $uninst);
        do brew uninstall $prog; done;
    fi
}



# fuzzy grep open via ag
az() {
  local file

    file="$(ag --nobreak --noheading $@ | fzf -0 -1 --reverse --height=30
    % | awk -F: '{print $1 " +" $2}')"

    if [[ -n $file ]]
    then
        vim $file
    fi
}

# show newest files
newest() {
    find . -type f -printf '%TY-%Tm-%Td %TT %p\n' |\
    grep -v cache |\
    grep -v ".hg" |\
    grep -v ".git" |\
    sort -r | less
}