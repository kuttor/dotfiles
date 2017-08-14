#! /bin/bash

# Author: Andrew Kuttor
# E-mail: andrew.kuttor@gmail.com

# ==============================================================================
# Terminal
# ==============================================================================

# Absolute path to this script, e.g. /home/user/bin/foo.sh
DOTFILES="$(dirname $(readlink -f $BASH_SOURCE))/"
SCRIPT_DIR="$HOME/.dotfiles"

# Set current user perms +rwrite 
umask 022

# Extend Less filetype compatabilities
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Give LS filetypes lots of colors
eval $(dircolors -b $SCRIPT_DIR/dircolors)

# ==============================================================================
# Shopt
# ==============================================================================

shopt -s autocd         # Auto cd when navigating file system
shopt -s nocaseglob     # Case in-sensitive globbing
shopt -s cdspell        # Autocorrect typos in path when using cd
shopt -s checkwinsize   # Checks/Modifies term window size per command
shopt -s progcomp       # Programmable completions
shopt -s expand_aliases # Expands aliases while in use

# ==============================================================================
# Special
# ==============================================================================

# Hub: https://github.com/github/hub
eval "$(hub alias -s)"

# Tilix VTE
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source "/etc/profile.d/vte.sh"
fi

# ==============================================================================
# Completions
# ==============================================================================

# Programmable completions
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Sudo
complete -cf sudo

# SSH hostnames
[ -e "$HOME/.ssh/config" ] && \
    complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config |\
    grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh

# FZF
[[ $- == *i* ]] && . "/usr/share/fzf/completion.bash" 2> "/dev/null"

# ==============================================================================
# Keybindings
# ==============================================================================

# FZF
. "/usr/share/fzf/key-bindings.bash"

# ==============================================================================
# Sources
# ==============================================================================

[[ -f "$SCRIPT_DIR/bash_functions" ]] && . "$SCRIPT_DIR/bash_functions"
[[ -f "$SCRIPT_DIR/bash_aliases" ]] && . "$SCRIPT_DIR/bash_aliases"
[[ -f "$SCRIPT_DIR/bash_history" ]] && . "$SCRIPT_DIR/bash_history"
[[ -f "$SCRIPT_DIR/exports" ]] && . "$SCRIPT_DIR/exports"
[[ -f "$SCRIPT_DIR/../inputrc" ]] && bind -f "$SCRIPT_DIR/inputrc"
