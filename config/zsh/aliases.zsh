#! /usr/bin/env zsh

# -- aliases ----------------------------------------------------------------------------------------------------------

# ~ ls ~
confirm lsd --alias ls
alias ll="lsd --long --git --human-readable --header --hyperlink=always "
alias l="lsd --oneline --group-directories-first --header --almost-all "

# ~ tree ~
confirm tre --alias tree

# ~ pagers ~
confirm bat --alias cat
confirm nvim --alias vim
confirm python3 --alias python

# ~ suffix ~
alias -s {md,markdown,rst,toml,json,conf,zsh,py,yaml,yml,sh,rb,bash}=code

# ~ osx specific ~
alias pbc="pbcopy"
alias pbp="pbpaste"

# ~ navigation ~
alias cls="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
 mkcd="mkdir -p $1 && cd $1"

# ~ paths ~
alias path_list="echo '$PATH' | tr ':' '\n'"
alias fpath_list="echo '$FPATH' | tr ':' '\n'"
alias cdpath_list="echo '$CDPATH' | tr ':' '\n'"
alias manpath_list="echo '$MANPATH' | tr ':' '\n'"

# ~ zmv ~
alias zcp="zmv -C"
alias zln="zmv -L"

# ~ colors ~
# define default colors
typeset -A default_colors=(
  [no]='00' [di]='01;34' [pi]='40;33' [do]='01;35' [bd]='40;33;01' [or]='40;31;01' [cd]='40;33;01' [ex]='01;32'
  [fi]='00' [ln]='01;36' [so]='01;35'
)

# define file extension colors
typeset -A ext_colors=(
  [tar]='01;31' [tgz]='01;31' [arj]='01;31' [taz]='01;31' [lzh]='01;31' [json]='01;35' [zip]='01;31' [dl]='01;35' 
  [bz2]='01;31' [deb]='01;31' [rpm]='01;31' [jar]='01;31' [jpg]='01;35' [jpeg]='01;35' [gif]='01;35' [py]='01;35'
  [bmp]='01;35' [pbm]='01;35' [pgm]='01;35' [ppm]='01;35' [tga]='01;35' [yaml]='01;35' [xbm]='01;35' [gz]='01;31'   
  [png]='01;35' [mov]='01;35' [mpg]='01;35' [avi]='01;35' [fli]='01;35' [mpeg]='01;35' [xpm]='01;35' [gl]='01;35' 
  [xcf]='01;35' [xwd]='01;35' [ogg]='01;35' [mp3]='01;35' [wav]='01;35' [tiff]='01;35' [tif]='01;35' [z]='01;31' 
)

# init custom colors if dircolors is unavailable 
(( $+commands[dircolors] )) && eval "$(dircolors -b "$ZDOTDIR/dircolors")" ||\
export LS_COLORS="$(generate_ls_colors)"

# vivid check and init ~ advanced color schemes
(( $+commands[vivid] )) && export LS_COLORS="$(vivid generate molokai)"

# set user_ls_colors to ls colors for consistency
export USER_LS_COLORS="$LS_COLORS"

# ~ manpages ~
alias manpages_zsh="$LESS +/zmv" man zshcontrib
