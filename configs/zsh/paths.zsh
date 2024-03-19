#!/usr/bin/env zsh
# Vim: Set filetype=zsh syntax=zsh
# File: ${HOME}/.dotfiles/configs/zsh/paths.zsh
# Description: Configuration file for zsh paths and fpath settings.

# ------------------------------------------------------------------------------
# ~ Path ~

path=(
  ${HOME}/.local/share/zsh/zinit/polaris/bin
  ${HOME}/.local/bin
  /usr/local/bin
  /usr/{sbin,bin}
  /{sbin,bin}
  ${HOMEBREW_PREFIX}/{sbin,bin}
  ${path}
)

# -- Path Related Aliases --
alias path_list='echo "$PATH" | tr ":" "\n"'

# Export existing PATHs and remove duplicates
typeset -gx path PATH
typeset -U path PATH

# ------------------------------------------------------------------------------
# ~ FPATH ~

typeset -U fpath FPATH

fpath=(
  ${HOME}/.local/share/zsh/site-functions
  /usr/local/share/zsh/5.8/site-functions
  /usr/share/zsh/{site-functions,functions}
  ${HOMEBREW_PREFIX}/opt/zsh-completions/share/zsh-completions
  ${HOMEBREW_PREFIX}/completions/zsh
  ${HOMEBREW_PREFIX}/share/zsh-completions
  ${fpath}
)

() {
    # add our local functions dir to the fpath
    local funcs=$HOME/.dotfiles/autoloads

    # FPATH is already tied to fpath, but this adds
    # a uniqueness constraint to prevent duplicate entries
    typeset -TUg +x FPATH=$funcs:$FPATH fpath
    
    # Now autoload them
    if [[ -d $funcs ]]; then
        autoload ${=$(cd "$funcs" && echo *)}
    fi
}

# -- FPATH Related Aliases --
alias fpath_list='echo "$FPATH" | tr ":" "\n"'

# -- Remove duplicates in FPATH --
typeset -gx FPATH fpath
typeset -U FPATH fpath

# ~ ----------------------------------------------------------------------------
# ~ MANPath, INFOPath ~

export MANPATH="${HOMEBREW_PREFIX}/share/man:${MANPATH+:$MANPATH}:"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"
