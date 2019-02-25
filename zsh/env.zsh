#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0 foldmethod=marker:
# file: env.zshv
# info: Main config file for env variables
# name: Andrew Kuttor
# mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

# VIP Folders
# -----------------------------------------------------------------------------
DOTFILES="$HOME/.dotfiles"
CACHE="$HOME/.cache"
CONFIG="$HOME/.config"
ZPLUG_HOME="/usr/local/opt/zplug"
ZSH_FUNCTIONS="$DOTFILES/functions"
VIM_SWAP="$HOME/.vimvimswap"
TMUX="$HOME/.config/tmux"
TMUX_PLUGINS="$HOME/.config/tmux/plugins"

# Report time of running processes
# -----------------------------------------------------------------------------
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Language
# -----------------------------------------------------------------------------
export LANGUAGE="en_US.UTF-8"
export LANG="$LANGUAGE"
export LC_ALL="$LANGUAGE"
export LC_CTYPE="$LANGUAGE"

# HOMEBREW
# -----------------------------------------------------------------------------
export HOMEBREW_GITHUB_API_TOKEN=aed27538de34dd4e7df7d5672c538f693f1109a0

# Pager
# -----------------------------------------------------------------------------
export HOMEBREW_GITHUB_API_TOKEN=aed27538de34dd4e7df7d5672c538f693f1109a0
export PAGER='bat'
export MANPAGER='bat'
export BAT_CONFIG_PATH="$DOTFILES/bat.conf"

# TERMINAL
# -----------------------------------------------------------------------------
export KEYTIMEOUT=1
export TERMINAL_DARK=1
export _Z_DATA="$CONFIG/z-data"
export ITERM_24BIT=1
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'

# EDITOR
# -----------------------------------------------------------------------------
export EDITOR=$(which vim)
export VISUAL="$EDITOR"
export CVSEDITOR="$EDITOR"
export SVN_EDITOR="$EDITOR"
export GIT_EDITOR="$EDITOR"

# ENV
# -----------------------------------------------------------------------------
export RBENV_ROOT="$(brew --prefix rbenv)"
export GEM_HOME="$(brew --prefix)/opt/gems"
export GEM_PATH="$(brew --prefix)/opt/gems"

# Pager
# -----------------------------------------------------------------------------
export PAGER='bat'
export MANPAGER='bat'
export BAT_CONFIG_PATH="$DOTFILES/bat.conf"

# Enhancd
# -----------------------------------------------------------------------------
ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
ENHANCD_DOT_SHOW_FULLPATH=1
ENHANCD_COMMAND="cdd"
ENHANCD_DIR="$CONFIG/enhancd/"
ENHANCD_DOT_SHOW_FULLPATH=1

# MOLECULE
# -----------------------------------------------------------------------------
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
