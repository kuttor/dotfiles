#! /usr/bin/env zsh

# tab/shift-tab cycles through menu 
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

# left/right arrow keys move cursor
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char

# enter key accepts command
bindkey -M menuselect '^M' .accept-line

# add space to specific completions
zstyle ':autocomplete:*' add-space \
    executables aliases functions builtins reserved-words commands
