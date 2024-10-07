#!/usr/bin/env zsh

# =============================================================================
# -- aliases ------------------------------------------------------------------
# =============================================================================

# -- lsd available --
if command -v lsd >/dev/null 2>&1; then
  alias ls="lsd"
else
  alias ls="ls"
fi

alias ll=eza \
--group-directories-first \
--almost-all \
--git \
--total-size \
--links \
--header \
--icons=always \
--oneline \
--colour=always

# -- cd --
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# bat or ccat if available
if command -v bat >/dev/null 2>&1; then
  alias bat="cat"
elif command -v ccat >/dev/null 2>&1; then
  alias ccat="cat"
fi

# -- suffix aliases --
alias -s {md,markdown,rst,toml,json,conf,zsh,py,yaml,yml,sh}=code

# -- mac specific --
alias pbc="pbcopy"
alias pbp="pbpaste"

# -- navigation --
alias mkcd="mkdir -p $1 && cd $1"
alias lsd="lsd --oneline --group-directories-first "
alias fpath_list="echo '$FPATH' | tr ':' '\n'"
alias path_list="echo '$PATH' | tr ':' '\n'"

# -- editors --
alias nano="nano --mouse"
alias vim="nvim"
alias python="python3"

# -- zmv --
alias zcp="zmv -C"
alias zln="zmv -L"

# define default colors
typeset -A default_colors=(
    [no]='00'    [fi]='00'    [di]='01;34' [ln]='01;36'
    [pi]='40;33' [so]='01;35' [do]='01;35' [bd]='40;33;01'
    [cd]='40;33;01' [or]='40;31;01' [ex]='01;32'
)

# define file extension colors
typeset -A ext_colors=(
    [tar]='01;31' [tgz]='01;31' [arj]='01;31' [taz]='01;31'
    [lzh]='01;31' [zip]='01;31' [z]='01;31'   [Z]='01;31'
    [gz]='01;31'  [bz2]='01;31' [deb]='01;31' [rpm]='01;31'
    [jar]='01;31'
    [jpg]='01;35' [jpeg]='01;35' [gif]='01;35' [bmp]='01;35'
    [pbm]='01;35' [pgm]='01;35'  [ppm]='01;35' [tga]='01;35'
    [xbm]='01;35' [xpm]='01;35'  [tif]='01;35' [tiff]='01;35'
    [png]='01;35' [mov]='01;35'  [mpg]='01;35' [mpeg]='01;35'
    [avi]='01;35' [fli]='01;35'  [gl]='01;35'  [dl]='01;35'
    [xcf]='01;35' [xwd]='01;35'  [ogg]='01;35' [mp3]='01;35'
    [wav]='01;35'
)

# use dircolors if available, otherwise use our custom colors
if (( $+commands[dircolors] )) && [[ -f "$ZDOTDIR/dircolors" ]]; then
    eval "$(dircolors -b "$ZDOTDIR/dircolors")"
else
    export LS_COLORS="$(generate_ls_colors)"
fi

# set USER_LS_COLORS for consistency
export USER_LS_COLORS="$LS_COLORS"

# optionally, use vivid for even more advanced color schemes
if (( $+commands[vivid] )); then
    export LS_COLORS="$(vivid generate molokai)"
fi

alias manpages_zsh="$LESS +/zmv" man zshcontrib
