#!/usr/bin/env zsh

# =============================================================================
# -- aliases ------------------------------------------------------------------
# =============================================================================

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
#alias zinit="zi"

# compaudit for insecure directories
#alias compaudit_secure_directories="compaudit | xargs chmod g-w,o-w"

#alias manpages_zsh="$LESS +/zmv" man zshcontrib
