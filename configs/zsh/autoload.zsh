#! /usr/bin/env zsh
# shellcheck shell=zsh
# vim:set ft=zsh st=zsh nu clipboard+=unnamedplus foldmethsofttabstop=0

# ------------------------------------------------------------------------------
# -- Zsh Modules ---------------------------------------------------------------
# ------------------------------------------------------------------------------
zmodload zsh/parameter
zmodload zsh/terminfo
zmodload zsh/compctl
zmodload zsh/complist
zmodload zsh/computil
zmodload zsh/zle
zmodload zsh/curses
zmodload zsh/files
zmodload zsh/mapfile
zmodload zsh/zutil
zmodload -a zsh/zpty zpty
zmodload -ap zsh/mapfile mapfile

# ------------------------------------------------------------------------------
# -- Zsh Autoloads -------------------------------------------------------------
# ------------------------------------------------------------------------------
autoload -U zed
autoload -U delta
autoload -U zargs
autoload -U zcalc
autoload -U parseopts
autoload -Uz run-help
autoload -Uz is-at-least
autoload -Uz add-zsh-hook
autoload -Uz read-ini-file
autoload -Uz colors; colors
autoload -Uz zmv; zle -N zmv
autoload -Uz history-search-end
autoload -Uz reset-broken-terminal
autoload -Uz vcs_info; zle -N vcs_info
autoload -Uz is-at-least; zle -N is-at-leasto
autoload -Uz pbcopy-buffer; zle -N pbcopy-buffer
autoload -U select-word-style; select-word-style bash
autoload -U edit-command-line; zle -N edit-command-line
autoload -U url-quote-magic; zle -N self-insert url-quote-magic
autoload -U expand-or-complete-with-dots; zle -N expand-or-complete-with-dots
autoload -Uz bracketed-paste-url-magic; zle -N bracketed-paste bracketed-paste-url-magic

for r in run-help-{git,ip,openssl,p4,sudo,svk,svn}; do autoload -Uz $r; done

# run-help ~
(( ${+aliases[run-help]} )) && unalias run-help
alias help="run-help"

# history-beginning-search-backward-end and history-beginning-search-forward-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# https://github.com/zsh-users/zsh-autosuggestions/issues/351
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)

WORDCHARS='*?_-[]~&;!#$%^(){}<>|'



# ------------------------------------------------------------------------------
# -- Zsh Autoload Functions ----------------------------------------------------
# ------------------------------------------------------------------------------

() {
    local FUNCS="${HOME}/.dotfiles/functions"
    typeset -TUg +x FPATH=$FUNCS:$FPATH fpath
    [[ -d $FUNCS ]] && for i in $FUNCS/*(:t); autoload -U $i
}

