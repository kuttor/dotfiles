#!/usr/bin/env zsh
# Vim: Set filetype=zsh syntax=zsh
# File: ${HOME}/.dotfiles/configs/zsh/paths.zsh
# Description: Configuration file for zsh paths and fpath settings.

# Add paths to PATH
path=(
  ${HOME}/.local/share/zsh/zinit/polaris/bin
  ${HOME}/.local/bin
  /usr/local/bin
  /usr/{sbin,bin}
  /{sbin,bin}
  ${HOMEBREW_PREFIX}/{sbin,bin}
  ${path}
)

# Add functions paths to fpath
fpath=(
  ${HOME}/.local/share/zsh/site-functions
  /usr/local/share/zsh/5.8/site-functions
  /usr/share/zsh/{site-functions,functions}
  ${HOMEBREW_PREFIX}/opt/zsh-completions/share/zsh-completions
  ${HOMEBREW_PREFIX}/completions/zsh
  ${HOMEBREW_PREFIX}/share/zsh-completions
  ${fpath}
)

# -- Remove duplicates in FPATH --
typeset -Ugx FPATH fpath path PATH
