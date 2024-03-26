#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh

zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold" # Color in which to highlight matched, searched text (default bg=17 on 256-color terminals)
zstyle ":history-search-multi-word" page-size "8"                    # Number of entries to show (default is $LINES/3)
zstyle ":plugin:history-search-multi-word" active "underline"        # Effect on active history entry. Try: standout, bold, bg=blue (default underline)
zstyle ":plugin:history-search-multi-word" check-paths "yes"         # Whether to check paths for existence and mark with magenta (default true)
zstyle ":plugin:history-search-multi-word" clear-on-cancel "no"      # Whether pressing Ctrl-C or ESC should clear entered query
zstyle ":plugin:history-search-multi-word" synhl "yes"               # Whether to perform syntax highlighting (default true)

typeset -gA HSMW_HIGHLIGHT_STYLES
HSMW_HIGHLIGHT_STYLES[path]="bg=magenta,fg=white,bold"
HSMW_HIGHLIGHT_STYLES[double-hyphen-option]="fg=cyan"
HSMW_HIGHLIGHT_STYLES[single-hyphen-option]="fg=cyan"
HSMW_HIGHLIGHT_STYLES[commandseparator]="fg=241,bg=17"