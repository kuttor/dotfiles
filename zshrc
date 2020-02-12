# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# file: zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com
TRAPWINCH() { zle && { zle reset-prompt; zle -R }}
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
