#! /usr/bin/env zsh
EZA_DEFAULT_FLAGS=" \
--all \
--group-directories-first \
--time-style=long-iso \
--sort=name \
--icons=always"

# -- aliases --
alias ll="\
eza "${EZA_DEFAULT_FLAGS}" \
--binary \
--classify \
--context \
--created \
--git \
--git-repos \
--header \
--long \
--modified \
"

alias ls="eza "${EZA_DEFAULT_FLAGS}" --across"
alias l="ls"
alias tree="ll --tree"