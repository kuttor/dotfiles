#!/usr/bin/env zsh
# shellcheck shell=zsh
# VIM: set filetype=zsh syntax=zsh

export _ZO_DATA_DIR="${LOCAL_DATA}/zoxide" && mkdir -p "${_ZO_DATA_DIR}"
export _ZO_ECHO=1
export _ZO_RESOLVE_SYMLINKS=1
export _ZO_FZF_OPTS=" \
--no-sort \
--keep-right \
--height=50% \
--info=inline \
--layout=reverse \
--exit-0 \
--select-1 \
--bind=ctrl-z:ignore \
--preview='\command eza --long --all {2..}' --preview-window=right \
"

eval "$(zoxide init zsh)"
