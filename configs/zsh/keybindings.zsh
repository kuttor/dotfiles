# ------------------------------------------------------------------------------ 
# ~ Keybindings ~
# ------------------------------------------------------------------------------

stty intr '^C'        # Ctrl+C cancel
stty susp '^Z'        # Ctrl+Z suspend
stty stop undef

bindkey " " magic-space
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

source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
