#!/usr/local/bin/zsh
# vim:set ft=zsh ts=4 sw=4 sts=0
# -----------------------------------------------------------------------------
# file: zshrc
# info: main configuration file
# name: andrew kuttor
# mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------
limit coredumpsize 0
skip_global_compinit=1

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

# ENHANCD
ENHANCD_COMMAND="cdd"
ENHANCD_DIR="$HOME/.config/enhancd/"
ENHANCD_FILTER="z"
ENHANCD_DOT_SHOW_FULLPATH=1

# Manage SSH keys with keychain
if $(command -v keychain >/dev/null); then
  keychain id_rsa
  source "$HOME/.keychain/$(hostname)-sh"
fi

# Sources
# ==============================================================================
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
