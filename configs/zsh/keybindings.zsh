# =============================================================================
# Keybindings
# =============================================================================

bindkey " " magic-space
#bindkey "^E" edit-command-line
#bindkey "^I" expand-or-complete-with-dots
#bindkey "^X^L" insert-last-command-output
bindkey "^[[1;2C" forward-word
bindkey "^[[1;2D" backward-word
bindkey "^[^[[C" end-of-line
bindkey "^[^[[D" beginning-of-line
bindkey -e

source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
