#!/usr/local/bin/zsh

# Emacs keybindings
bindkey -e

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# Space does history expansion
bindkey " " magic-space

# FN + Arrow keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# FZF and TMUX
bindkey "^r" fzf-insert-history

