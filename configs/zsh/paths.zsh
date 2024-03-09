#!/bin/bash
# Vim: Set filetype=zsh syntax=zsh
# File: ${HOME}/.dotfiles/configs/zsh/paths.zsh
# Description: Configuration file for zsh paths and fpath settings.

# ~~ Path Settings -------------------------------------------------------------

# Export existing paths.
typeset -gx path PATH

path=(
  ${HOME}/.local/bin
  /usr/local/bin
  /usr/{sbin,bin}
  /{sbin,bin}
  ${HOMEBREW_PREFIX}/{sbin,bin}
  ${path}
)

# -- Path Related Aliases --
alias path_list='echo "$PATH" | tr ":" "\n"'

# ~ ----------------------------------------------------------------------------
# ~ FPath ~

typeset -gx fpath FPATH

fpath=(
  ${HOME}/.local/share/zsh/site-functions
  /usr/local/share/zsh/site-functions
  /usr/share/zsh/site-functions
  /usr/local/share/zsh/functions
  /usr/share/zsh/functions
  /usr/local/share/zsh/site-functions
  ${fpath}
)

for function in ${HOME}/.dotfiles/autoloads/*; do
  autoload $function
done

# --  FPath Related Aliases --
alias fpath_list='echo "$FPATH" | tr ":" "\n"'

# ~ ----------------------------------------------------------------------------
# ~ MANPath, INFOPath ~

export MANPATH="${HOMEBREW_PREFIX}/share/man:${MANPATH+:$MANPATH}:"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"
