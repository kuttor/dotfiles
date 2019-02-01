#!/usr/local/bin/zsh
# ------------------------------------------------------------------------------
# file  : history.zsh
# info  : Extended history configurations for dotfiles
# name  : Andrew Kuttor
# mail  : andrew.kuttor@gmail.com
# ------------------------------------------------------------------------------

# history
setopt APPENDHISTORY

# aliases
alias h="history"

# export
export HISTFILE="$HOME/.zsh_history"                 # History file name
export HISTSIZE=100000                               # History file size
export HISTCONTROL="ignoredups:erasedups"            # Ignore lead-space & dupes
export HISTTIMEFORMAT="[%F %T] "                     # Custom time format
export HISTIGNORE="ls:cd:exa:pwd:exit:history:clear" # Ignore recording commands

<<<<<<< HEAD
=======
# zsh-history-enhanced settings
ZSH_HISTORY_FILTER="fzf:percol"
ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
>>>>>>> refs/remotes/origin/master
