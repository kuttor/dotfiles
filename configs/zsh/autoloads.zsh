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

# ---------- TODO, suggested organization

#
# autoload -U edit-command-line
# autoload -U parseopts
# autoload -U select-word-style
# autoload -U url-quote-magic
# autoload -U zargs
# autoload -U zcalc
# autoload -U zed
# autoload -U zmv
# autoload -Uz colors && colors
# autoload -Uz history-search-end
# autoload -Uz is-at-least
#
# bindkey " " magic-space
# bindkey "^E" edit-command-line
# bindkey "^I" expand-or-complete-with-dots
# bindkey "^N" history-beginning-search-forward-end
# bindkey "^N" history-beginning-search-forward-end
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^X^L" insert-last-command-output
# bindkey "^[[1;2C" forward-word
# bindkey "^[[1;2D" backward-word
# bindkey "^[[F" end-of-line
# bindkey "^[[H" beginning-of-line
# bindkey -e
#
# zle -N edit-command-line
# zle -N expand-or-complete-with-dots
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# zle -N insert-last-command-output
# zle -N select-word-style bash
# zle -N self-insert url-quote-magic
