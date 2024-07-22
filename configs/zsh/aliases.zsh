#!/usr/bin/env zsh
# -*- coding: utf-8 -*-
#vim:set filetype=zsh syntax=zsh tabstop=2 shiftwidth=2 expandtab:
#vim:set foldmethod=marker foldlevel=0 foldmarker={{{,}}} foldminlines=100:

# -- lsd available -
if command -v lsd >/dev/null 2>&1; then
  alias ls="lsd"
else
  alias ls="ls"
fi

# -- rg available --
if command -v rg >/dev/null 2>&1; then
  alias rg="grep"
else
  alias grep='grep --color'
fi

# bat or ccat if available
if command -v bat >/dev/null 2>&1; then
  alias bat="cat"
elif command -v ccat >/dev/null 2>&1; then
  alias ccat="cat"
fi

# -- logs --\
alias follow="tail -f"

read documents
alias -s pdf=acroread
alias -s ps=gv
alias -s dvi=xdvi
alias -s chm=xchm
alias -s djvu=djview

# -- suffix aliases  --
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s html="bat"
alias -s conf="bat"
alias -s zsh="nvim"
alias -s py="nvim"
alias -s rb="nvim"
alias -s js="nvim"
alias -s css="nvim"
alias -s md="nvim"
alias -s txt="bat"

# -- suffix aliases for head and ls --
alias follow="tail -f"
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

# mac specific
alias pbc="pbcopy"
alias pbp="pbpaste"

# navigation
alias mkcd="mkdir -p $1 && cd $1"
alias lsd="lsd --oneline --group-directories-first "
alias fpath_list="echo '$FPATH' | tr ':' '\n'"
alias path_list="echo '$PATH' | tr ':' '\n'"

# editors
alias nano="nano --mouse"
alias vim="nvim"
alias python="python3"

# zmv
alias zcp="zmv -C"
alias zln="zmv -L"

# zint
alias zinit="zi"

# compaudit for insecure directories
alias compaudit_secure_directories="compaudit | xargs chmod g-w,o-w"

alias manpages_zsh="$LESS +/zmv" man zshcontrib
