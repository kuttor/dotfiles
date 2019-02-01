#! /bin/bash

# ------------------------------------------------------------------------------
# Name    : bashrc
# About   : Extended usercode/configurations for Bash
# Author  : Andrew Kuttor
# Contact : andrew.kuttor@gmail.com
#
# Reference:
#   - https://github.com/ogham/exa
#   - https://github.com/magicmonty/bash-git-prompt
#   - https://github.com/github/hub
#   - https://github.com/junegunn/fzf
# ------------------------------------------------------------------------------

# Vars
DOTS=$HOME/.dotfiles

# NeoVim
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Editor
export EDITOR="vim"

# For Windows Molecule testing
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# z
[ -f $HOME/Code/z/z.sh ] && source $HOME/Code/z/z.sh

# fzf
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Colors
export CLICOLOR=1

# Hub
eval "$(hub alias -s)"

# Colored Man pages
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    man "$@"
}

# Completions
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
#if [ -d /usr/local/etc/bash_completion.d ]; then
#  for file in /usr/local/etc/bash_completion.d/*; do
#    . $file
#  done
#fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# Builtins
shopt -s autocd          # Auto execute CD
#shopt -s nocaseglob     # Case in-sensitive globbing
shopt -s cdspell         # Autocorrect arguments in cd
shopt -s dirspell        # Autocorrect directory name
shopt -s checkwinsize    # Checks window size per command
shopt -s progcomp        # Programmable completions
shopt -s expand_aliases  # Expands aliases
shopt -s histappend      # Append to history file, don't overwrite
shopt -s histreedit      # Edit history after failed sub
shopt -s histverify      # Verify expansion before execute

# Sources
[[ -f "$DOTS/functions" ]] && . $DOTS/functions
[[ -f "$DOTS/aliases" ]] && . $DOTS/aliases
[[ -f "$DOTS/history" ]] && . $DOTS/history
[[ -f "$DOTS/completions" ]] && . $DOTS/completions 

# prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi
