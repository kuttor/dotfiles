#!/usr/bin/env zsh

# Emacs style bindings (for Home/End keys...)
bindkey -e

# In menu completion, the Return key will accept the current selected match
bindkey -M menuselect '^M' .accept-line

# shift-tab : go backward in menu (invert of tab)
bindkey '^[[Z' reverse-menu-complete

# alt-x : insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^[x' insert-last-command-output

# ctrl+b/f or ctrl+left/right : move word by word (backward/forward)
bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Ctrl+space: print Git status
bindkey -s '^ ' 'git status --short^M'

# Accept and execute the current suggestion (using zsh-autosuggestions)
# Find the key with: showkey -a
# '^J': Ctrl+Enter
bindkey '^J' autosuggest-execute

# Disable the capslock key and map it to escape
#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
setxkbmap -option caps:escape

# Disable flow control (ctrl+s, ctrl+q) to enable saving with ctrl+s in Vim
stty -ixon -ixoff
