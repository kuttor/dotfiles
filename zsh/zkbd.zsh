#!/usr/local/bin/zsh

# Emacs keybindings
bindkey -e

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# Expand aliases inline
zle -N globalias
bindkey " " globalias

# Space does history expansion
bindkey " " magic-space

# Expand waiting to complete dots
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Navigation
bindkey "^[[1;5D" beginning-of-line
bindkey "^[[1;5C" end-of-line
bindkey "^[[1;7D" backward-word
bindkey "^[[1;7C" forward-word
bindkey '^[[2~'   overwrite-mode                      
bindkey '^[[3~'   delete-char                        
bindkey '^[[C'    forward-char                      
bindkey '^[[D'    backward-char                    
bindkey '^[[5~'   history-beginning-search-backward 
bindkey '^[[6~'   history-beginning-search-forward 
bindkey '^[[A'    up-line-or-history
bindkey '^[[B'    down-line-or-history
bindkey '^W'      backward-kill-word 
bindkey '^Z'      undo 	
