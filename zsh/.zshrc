#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0
# -----------------------------------------------------------------------------
# file: .zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

limit coredumpsize 0
skip_global_compinit=1
_comp_options+=(globdots)

# Ubuntu's Command-Not-Found functionality
if brew command command-not-found-init >/dev/null 2>&1; then
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
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# Reclaim ctrl-s and ctrl-q
stty -ixon -ixoff

# Manage SSH keys with keychain
if $(command -v keychain >/dev/null); then
  keychain id_rsa
  source "$HOME/.keychain/$(hostname)-sh"
fi

# -----------------------------------------------------------------------------
# Sources
# -----------------------------------------------------------------------------
source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/paths.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/colors.zsh"
source "$ZDOTDIR/completes.zsh"
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/zkbd.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/zplug.zsh"
source "$HOME/.iterm2_shell_integration.zsh"
