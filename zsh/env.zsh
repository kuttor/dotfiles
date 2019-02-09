#!/usr/local/bin/zsh
# vim:set ft=zsh ts=4 sw=4 sts=0 foldmethod=marker:
# -----------------------------------------------------------------------------
# file: env.zshv
# info: Main config file for env variables
# name: Andrew Kuttor
# mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------
skip_global_compinit=1
mypath="$( cd "$(dirname "$0")" ; pwd -P )"
echo $mypath

# ENV VAR
# ==============================================================================
export ZDOTDIR="/zsh"
export ZPLUG_HOME="/usr/local/opt/zplug"
export VIM_SWAP="$HOME/.vimswap"
export ZSH="$DOTFILES/zsh"
export ZSH_FUNCTIONS="$DOTFILES/functions"
export CACHE="$HOME/.cache/"

# LANGUAGE
# ==============================================================================
export LANGUAGE="en_US.UTF-8"
export LANG="$LANGUAGE"
export LC_ALL="$LANGUAGE"
export LC_CTYPE="$LANGUAGE"

# HOMEBREW
# ==============================================================================
export HOMEBREW_GITHUB_API_TOKEN=aed27538de34dd4e7df7d5672c538f693f1109a0

# Pager
# ==============================================================================
export PAGER='bat'
export MANPAGER='bat'
export BAT_CONFIG_PATH="$DOTFILES/bat.conf"

# TERMINAL
# ==============================================================================
export KEYTIMEOUT=1
export TERMINAL_DARK=1
export _Z_DATA="$HOME/.config/z-data"
export ITERM_24BIT=1
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'

# EDITOR
# ==============================================================================
export EDITOR=$(which vim)
export VISUAL="$EDITOR"
export CVSEDITOR="$EDITOR"
export SVN_EDITOR="$EDITOR"
export GIT_EDITOR="$EDITOR"

# FZF
# ==============================================================================
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
FZF_DEFAULT_OPTS="--extended-exact --height 100% --cycle --no-reverse --bind ctrl-a:select-all "
FZF_DEFAULT_OPTS+="--bind pgup:preview-up --bind pgdn:preview-down --bind ctrl-f:jump --bind ctrl-k:kill-line --bind ctrl-p:toggle-preview"
FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# z.lua
# ==============================================================================
eval "$(lua ${ZPLUG_REPOS}/skywind3000/z.lua/z.lua --init zsh)"
_ZL_CMD="y"                               # command alias
_ZL_DATA="$HOME/.config/zdatafile.lua"    # datafile location
_ZL_ECHO=1                                # Echo dirname after CD.
_ZL_MATCH_MODE=1                          # Enable enhanced master.

# Pager
# ==============================================================================
export PAGER='bat'
export MANPAGER='bat'
export BAT_CONFIG_PATH="${DOTFILES}/bat.conf"

# ENHANCD
# ==============================================================================
export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
export ENHANCD_DOT_SHOW_FULLPATH=1

# MOLECULE
# ==============================================================================
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
