#! /bin/bash

# ------------------------------------------------------------------------------
# Name    : bashrc
# About   : Extended user configurations for Bash
# Author  : Andrew Kuttor
# Contact : andrew.kuttor@gmail.com
# ------------------------------------------------------------------------------

# dotfiles Env Var
DOTFILES="$(dirname $(readlink -f $BASH_SOURCE))"

# language
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# editor
export EDITOR="vim"

# colors
# eval $( dircolors -b "$HOME/.config/dircolors" )
# eval $(dircolors -b ~/code/dircolors-solarized/dircolors.ansi-dark)
export LS_COLORS='ow=01;36;40'

# set BUILTIN defaults
shopt -s autocd             # Auto cd when navigating file system
shopt -s nocaseglob         # Case in-sensitive globbing
shopt -s cdspell            # Autocorrect typos in path when using cd
shopt -s checkwinsize       # Checks/Modifies term window size per command
shopt -s progcomp           # Programmable completions
shopt -s expand_aliases     # Expands aliases while in use

# bash functions
[[ -f "$DOTFILES/bash_functions.sh" ]] && \
  source "$DOTFILES/bash_functions.sh"

# bash history
[[ -f "$DOTFILES/bash_history.sh" ]] && \
  source "$DOTFILES/bash_history.sh"

# bash aliases
[[ -f "$DOTFILES/bash_aliases.sh" ]] && \
  source "$DOTFILES/bash_aliases.sh"

# fzf
[[ -f "$DOTFILES/fzf.sh" ]] && \
  source "$DOTFILES/fzf.sh"

# bash prompt
if [[ -f "$HOME/.config/bash-prompt/gitprompt.sh" ]]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_THEME=Solarized
    source "$HOME/.config/bash-prompt/gitprompt.sh"
fi

# bash completion
if ! shopt -oq posix; then
  if [ -f "/usr/share/bash-completion/bash_completion" ]; then
    source "/usr/share/bash-completion/bash_completion"
  elif [ -f "/etc/bash_completion" ]; then
    source "/etc/bash_completion"
  fi
fi

