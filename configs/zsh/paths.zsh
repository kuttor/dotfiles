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

# Load autoloaded Functions
() {
    local FUNCS="${HOME}/.dotfiles/functions"

    # Prevent duplicates
    typeset -TUg +x FPATH=$FUNCS:$FPATH fpath
    [[ -d $FUNCS ]] && for i in $FUNCS/*(:t); autoload -U $i

    # Now autoload them
    # if [[ -d $funcs ]]; then
    #     autoload ${=$(cd "$funcs" && echo *)}
    # fi
    
    #[[ -d $FUNCS ]] && for i in $FUNCS/*(:t); autoload -U $i;

}

# -- Remove duplicates in FPATH --
typeset -Ugx FPATH fpath path PATH

# Other paths
export MANPATH="${HOMEBREW_PREFIX}/share/man:${MANPATH+:$MANPATH}:"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"
