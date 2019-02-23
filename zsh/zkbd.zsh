#!/usr/local/bin/zsh

# Emacs keybindings
bindkey -e

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# Space does history expansion
bindkey " " magic-space

# Expand waiting to complete dots
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# FN + Arrow keys
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[1;2H" backward-word
bindkey "^[[1;2F" forward-word
