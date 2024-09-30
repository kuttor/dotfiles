#!/usr/bin/env zsh

# ==============================================================================
# -- paths ---------------------------------------------------------------------
# ==============================================================================

# add locations to path
path=(
  $ZPFX/bin
  $HOME/.local/share/zsh/zinit/polaris/bin
  $HOME/.local/bin
  /usr/local/bin
  /usr/{sbin,bin}
  /{sbin,bin}
  $HOMEBREW_PREFIX/{sbin,bin}
  $path
)

# add function paths to fpath
fpath=(
  $HOME/.local/share/zsh/site-functions
  /usr/local/share/zsh/5.8/site-functions
  /usr/share/zsh/{site-functions,functions}
  $HOMEBREW_PREFIX/opt/zsh-completions/share/zsh-completions
  $HOMEBREW_PREFIX/completions/zsh
  $HOMEBREW_PREFIX/share/zsh-completions
  $fpath
)

# remove path duplicates
typeset -Ugx FPATH fpath path PATH

# -- homebrew paths --
export PATH="$HOMEBREW_PREFIX/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"

