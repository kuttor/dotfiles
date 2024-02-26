#! /usr/bin/env zsh
# Vim:Set filtype=zsh syntax=zsh

# Export existing paths.
typeset -gxU path PATH
typeset -gxU fpath FPATH


# Set the list of directories that zsh searches for commands.
path=(
  $HOME/.local/bin
  /usr/local/bin
  /usr/{sbin,bin}
  /{sbin,bin}
  $path
)

#autoload ${DOTFILES[AUTOLOADS]}/*



  #/opt/homebrew/share/zsh/{functions,site-functions}
  #/opt/homebrew/share/zsh/zsh-functions
  #/usr/share/zsh/site-functions
  #/usr/share/zsh/5.9/functions
