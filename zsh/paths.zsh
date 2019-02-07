#!/usr/local/bin/zsh

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# fpath
# ==============================================================================
typeset -U fpath
fpath=(
  $(brew --prefix)/share/zsh-completions
  ${DOTFILES}/functions
  ${fpath}
)

# SYSTEM PATHS
# ==============================================================================
typeset -U path
path=(
  /usr/local/{bin,sbin}(N-/)
  /usr/{bin,sbin}(N-/)
  /{bin,sbin}(N-/)
  /usr/local/lib/python2.7/site-packages(N-/)
  /usr/local/lib/python3.7/site-packages(N-/)
  ${path}
)
