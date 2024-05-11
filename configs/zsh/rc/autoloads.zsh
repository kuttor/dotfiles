#! /usr/bin/env zsh
# vim:set nu clipboard+=unnamedplus foldmethsofttabstop=0
# ZSH modules

autoload -U zed
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
autoload -Uz is-at-least; zle -N is-at-least
autoload -Uz select-word-style; select-word-style

# ctrl-w to specify custom word select

zstyle ':zle:*' word-style unspecified

# shift-tab to reverse completion
zmodload zsh/complist
bindkey '^[[Z' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

# copy buffer
zle -N pbcopy-buffer
bindkey '^X^Y' pbcopy-buffer
bindkey '^Xy' pbcopy-buffer
bindkey '^[u' undo
bindkey '^[r' redo

# edit command-line using editor (like fc command)
autoload -U edit-command-line; zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
#bindkey "^E" edit-command-line

# delta for git diff
autoload -U delta

# url-quote-magic for url completions in zsh
autoload -U url-quote-magic; zle -N self-insert url-quote-magic

# expand-or-complete-with-dots for better tab completion
autoload -U expand-or-complete-with-dots; zle -N expand-or-complete-with-dots

# bracketed-paste-url-magic for pasting URLs in zsh
autoload -Uz bracketed-paste-url-magic; zle -N bracketed-paste bracketed-paste-url-magic

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

() {
    local FUNCS="${HOME}/.dotfiles/functions"

    typeset -TUg +x FPATH=$FUNCS:$FPATH fpath
    [[ -d $FUNCS ]] && for i in $FUNCS/*(:t); autoload -U $i
}
