#! /usr/bin/env zsh
# vim:set nu clipboard+=unnamedplus foldmethsofttabstop=0
# ZSH modules

autoload -U zed
autoload -U zcalc
autoload -U zargs
autoload -Uz run-help
autoload -U parseopts
autoload -Uz is-at-least
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz zmv && zle -N zmv
autoload -Uz history-search-end
autoload -Uz vcs_info && zle -N vcs_info
autoload -Uz is-at-least && zle -N is-at-least
autoload -U edit-command-line && zle -N edit-command-line
autoload -U select-word-style && zle -N select-word-style bash
autoload -U url-quote-magic && zle -N self-insert url-quote-magic
autoload -U expand-or-complete-with-dots && zle -N expand-or-complete-with-dots
autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic