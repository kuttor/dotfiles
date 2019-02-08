#!/usr/local/bin/zsh

# Emacs keybindings
bindkey -e

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Space does history expansion
bindkey ' ' magic-space

# FN + Arrow keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
