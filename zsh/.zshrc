#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# file: .zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com

export ZDOTDIR="${${(%):-%N}:A:h}"
limit coredumpsize 0
skip_global_compinit=1
stty -ixon -ixoff
_comp_options+=(globdots)

# Sources
source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/completes.zsh"
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/zplug.zsh"
source "$HOME/.iterm2_shell_integration.zsh"
dedupe_path # Remove any duplicate paths

 # UBuntu-like command suggestions for Brew`
if brew command command-not-found-init > /dev/null 2>&1; then
    eval "$(brew command-not-found-init)"
fi

# Quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Use ZMV
autoload -U zmv
alias zmv="noglob zmv -W"

# run-help
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# / . - , mark separate words when deleting
autoload -U select-word-style
select-word-style bash

# Add coloring
autoload -Uz colors && colors
autoload -U parseopts
autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv
