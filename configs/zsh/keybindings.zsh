# ------------------------------------------------------------------------------ 
# ~ Keybindings ~
# ------------------------------------------------------------------------------

bindkey " " magic-space
bindkey "^E" edit-command-line
bindkey "^I" expand-or-complete-with-dots
bindkey "^N" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^X^L" insert-last-command-output && zle -N insert-last-command-output
bindkey "^[[1;2C" forward-word
bindkey "^[[1;2D" backward-word
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[^[[C" end-of-line
bindkey "^[^[[D" beginning-of-line
bindkey -e

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
