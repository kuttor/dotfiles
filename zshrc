#!/usr/local/bin/zsh
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com

# -----------------------------------------------------------------------------

# Dotfiles location
export DOTFILES="${HOME}/.dotfiles"

# Functions Path
fpath=( $fpath "${DOTFILES}/functions" )
autoload -U "${DOTFILES}/functions"

# Language
export LANGUAG="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Prompt tweaks
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'

# Editor
export EDITOR=`which nvim`
export VISUAL="${EDITOR}"
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# EnhancedCD
export ENHANCD_DOT_SHOW_FULLPATH=1
export ENHANCD_FILTER="/usr/local/bin/fzf:fzf-tmux:fzf:percol"

# Bat configuration
export BAT_THEME="TwoDark"
export BAT_STYLE="numbers,changes,header"

# Use italic text on the terminal (not supported on all terminals)
#export bat-italic-text=always

# Add mouse scrolling support in less
export bat_pager="less -FR"

# Use C++ syntax (instead of C) for .h header files
#export bat-map-syntax h:cpp

# Auto-Fu-map-syntax .ignore:.gitignore
[[ -f "${ZPLUG}/HOME/repos/hchbaw/auto-fu.zsh" ]]&&\
source "${ZPLUG}/HOME/repos/hchbaw/auto-fu.zsh/auto-fu.zsh"

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

#zle-line-init () {auto-fu-init;}; zle -N zle-line-init

zle -N zle-line-init
zle -N zle-keymap-select auto-fu-zle-keymap-select
zstyle ':completion:*' completer _oldlist _complete

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ----------------------------------------------------------------------------
# Powertool configs, i.e. FZ, FZF
# -----------------------------------------------------------------------------

# Source FZF
[[ -f "${HOME}/.local/.fzf.zsh" ]] && source "${HOME}/.local/.fzf.zsh"

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
#export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info --color=dark,bg+:235,hl+:10,pointer:5'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
function _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
function _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Sources
source "${DOTFILES}/aliases"
source "${DOTFILES}/functions"
source "${DOTFILES}/zplugs"
source "${DOTFILES}/setoptions"
source "${DOTFILES}/history"
source "${DOTFILES}/keybindings"
source "${DOTFILES}/autoloads"
source "${DOTFILES}/completions"
