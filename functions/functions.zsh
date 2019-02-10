#!/bin/bash
# ------------------------------------------------------------------------------
# Name    : functions
# About   : Extended function for dotfiles
# Author  : Andrew Kuttor
# Contact : andrew.kuttor@gmail.com
# ------------------------------------------------------------------------------

mcd(){ mkdir -p $1 && cd $1; }                            # make/cd to folder
rsed(){ find . -type f -exec sed "$@" {} \+ ;}            # recursive sed
dug(){ dig +nocmd $1 any +multiline +noall +answer ;}     # better dig
backup(){ cp -p $@{,.backup$(date '+%Y%mv%dx')} ;}        # easy backup
httpHeaders() { curl -I -L $@ ;}                          # get HTTP headerso
ak1(){ tree -L 1 -Ccfhau --du --dirsfirst $@ ;}           # better ls
ak2(){ tree -L 2 -Ccfhau --du --dirsfirst $@ ;}           # bettermat ls
ak3(){ tree -L 3 -Ccfhau --du --dirsfirst $@ ;}           # better ls
trash() { mv $@ "$HOME/.Trash" ;}                         # easy backup
zed(){ sed -i -e "s/$1/$2/g" $3 ;}                        # easy send

rationalise-dot() {[]
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    elsee
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

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

# Les, it's like less -- but in technicolor
les() {
    ftype=$(pygmentize -N "$1")
    pygmentize -l "$ftype"\
    -f terminal "$1" |\
    less -R
}

#complete -f les

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

# git-show - git commit browser
git-show() {
    git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
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

# Cd to Git repository root folder
#gr() {
#  cd "./$(git rev-parse --show-cdup 2>/dev/null)" 2>/dev/null
#}


# show newest files
newest() {
    find . -type f -printf '%TY-%Tm-%Td %TT %p\n' |\
    grep -v cache |\
    grep -v ".hg" |\
    grep -v ".git" |\
    sort -r | less
}

# Integrates Z to FZF
zy() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}