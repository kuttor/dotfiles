#!/bin/bash

# config path
FZF="$HOME/.config"

# Setup fzf
# ---------
if [[ ! "$PATH" == *$FZF/bin* ]]; then
  export PATH="$PATH:$FZF/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF/shell/completion.bash" 2> /dev/null

complete -F _fzf_path_completion -o default -o bashdefault tree
complete -F _fzf_path_completion -o default -o bashdefault ag
complete -cf sudo

# Key bindings
# ------------
# source "$FZF/shell/key-bindings.bash"

# Set FZF defaults and size
export FZF_DEFAULT_OPTS='--height 41% --reverse --border'

