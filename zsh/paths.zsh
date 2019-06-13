#!/usr/local/bin/zsh

# Automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# fpath
# ==============================================================================

# Function paths
fpath=(
  #$(brew --prefix)/share/zsh-completions
  ${DOTFILES}/functions
  ${fpath}
)

autoload ak
autoload bd
autoload clean
autoload color
autoload dedupe_path
autoload do
autoload download
autoload envgrep
autoload expand-or-complete-with-dots
autoload functions.zsh
autoload _fzf_compgen_dir
autoload _fzf_compgen_path
autoload globalias
autoload _has
autoload _is
autoload lastpass
autoload line
autoload lpass
autoload pjson
autoload rule
autoload showoptions
autoload _try

## Autoload all function files
#if [[ -d $ZSH_FUNCTIONS ]]; then
#   for func in $ZSH_FUNCTIONS/*; do
#      unhash -f $func 2>/dev/null
#      autoload +X $func
#   done
#fi

# SYSTEM PATHS
# ==============================================================================

# System paths
path=(
  /usr/local/{bin,sbin}(N-/)
  /usr/{bin,sbin}(N-/)
  /{bin,sbin}(N-/)
  /usr/local/lib/python2.7/site-packages(N-/)
  /usr/local/lib/python3.7/site-packages(N-/)
  /Library/Frameworks/Python.framework/Versions/3.7/bin
  /usr/local/opt/gems/bin
  ${path}
)
