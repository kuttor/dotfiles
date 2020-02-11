#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# file: zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com
#TRAPWINCH() { zle && { zle reset-prompt; zle -R }}
export ZSH="$HOME/.dotfiles/zsh"
limit coredumpsize 0
skip_global_compinit=1
stty -ixon -ixoff

# Sources
source "$ZSH/zinit"
source "$ZSH/setopts"
source "$ZSH/env"
source "$ZSH/aliases"
source "$ZSH/completes"
source "$ZSH/keybind"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk
