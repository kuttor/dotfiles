#!/usr/bin/env zsh

# =================================================================================================
# -- paths ----------------------------------------------------------------------------------------
# =================================================================================================

# uses custom `add_path` function to add paths to the PATH variable
add_path $ZPFX/bin
add_path /{sbin,bin}
add_path /usr/{sbin,bin}
add_path $HOME/.local/bin
add_path /usr/local/bin
add_path $HOME/bin
add_path $HOMEBREW_PREFIX/{sbin,bin}

# uses custom `add_fpath` function to add paths to the FPATH variable
add_fpath $HOME/.local/share/zsh/site-functions
add_fpath /usr/local/share/zsh/5.8/site-functions
add_fpath /usr/share/zsh/{site-functions,functions}
add_fpath $HOMEBREW_PREFIX/opt/zsh-completions/share/zsh-completions
add_fpath $HOMEBREW_PREFIX/{sbin,bin}
add_fpath $HOMEBREW_PREFIX/completions/zsh
add_fpath $HOMEBREW_PREFIX/share/zsh-completions

# uses custom `add_manpath` function to add paths to the MANPATH 
add_manpath  "$HOMEBREW_PREFIX/share/man"

# uses custom `add_infopath` function to add paths to the INFOPATH
add_infopath "$HOMEBREW_PREFIX/share/info"

# remove duplicate paths from the PATH, MANPATH, INFOPATH, and FPATH
typeset -Ugx FPATH fpath path PATH MANPATH manpath INFOPATH infopath



