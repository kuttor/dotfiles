#! /usr/bin/env zsh
#FILE: '${HOME}/.dotfiles/hooks/l.autosuggests.zsh'
#VIM: set filetype=zsh syntax=zsh
#DESCRIPTION: Contains env-vars/settings for the zsh-autosuggestion plugin.

export _ZSH_HIGHLIGHT_HIGHLIGHTERS=()
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
export ZSH_AUTOSUGGEST_USE_ASYNC="1"
export ZSH_AUTOSUGGEST_MANUAL_REBIND="1"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="1"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
