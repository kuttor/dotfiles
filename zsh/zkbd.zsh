#!/usr/local/bin/zsh

# Emacs keybindings
bindkey -e

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Space does history expansion
bindkey ' ' magic-space

# FN + Arrow keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Bind UP and DOWN arrow keys for subsstring search.
zmodload zsh/terminfo
bindkey "^[^[[a" history-substring-search-up
bindkey "^[^[[b" history-substring-search-down
