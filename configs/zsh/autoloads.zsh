#! /usr/bin/env zsh
# vim:set nu clipboard+=unnamedplus foldmethsofttabstop=0

# ================================================================
# autoloading native ZSH modules
# ================================================================

autoload -Uz vcs_info
zle -N vcs_info

autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv


autoload -U edit-command-line
zle -N edit-command-line

autoload -U select-word-style
zle -N select-word-style bash

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz colors && colors

autoload -Uz history-search-end

#autoload -Uz is-at-least
#zle -N is-at-least

# autoload -Uz manydots-magic && manydots-magic

autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

#autoload -U add-zsh-hook
#zle -N add-zsh-hook zsh-hook

autoload -Uz zmv
zle -N zmv
