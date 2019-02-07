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

if [[ -d $ZSH_FUNCTIONS ]]; then
   # Autoload shell functions from $ZDIR/code with the executable bit on.
   for func in $ZSH_FUNCTIONS/*; do
      unhash -f $func 2>/dev/null
      autoload +X $func
   done
fi



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
