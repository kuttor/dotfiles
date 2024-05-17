#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh

FZF_FD_OPTS="--color='always' --hidden --follow --exclude='.git' --exclude='.vscode'"
FZF_PREVIEW_FILE_COMMAND="bat --color=always --style=plain"
FZF_DEFAULT_OPTS="--no-mouse --bind \"tab:accept,ctrl-y:preview-page-up,ctrl-v:preview-page-down,ctrl-e:execute-silent(\${VISUAL:-code} {+} >/dev/null 2>&1)\""
FZF_DEFAULT_COMMAND="fd --type f $FZF_FD_OPTS"
FZF_ALT_C_OPTS="--ansi --preview \"$FZF_PREVIEW_DIR_COMMAND {} 2>/dev/null\""
FZF_ALT_C_COMMAND="fd --type d . $FZF_FD_OPTS"
FZF_CTRL_T_OPTS="--ansi --bind \"ctrl-w:execute(\${EDITOR:-nano} {1} >/dev/tty </dev/tty)+refresh-preview\" --preview \"$FZF_PREVIEW_FILE_COMMAND {} 2>/dev/null\""
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
