#!/usr/local/bin/zsh
#
# file  : history.zsh
# info  : Extended history configurations for dotfiles
# name  : Andrew Kuttor
# mail  : andrew.kuttor@gmail.com

# -----------------------------------------------------------------------------
# Options
# -----------------------------------------------------------------------------

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt interactivecomments

# Aliases
# -----------------------------------------------------------------------------
alias h="history"

# backward/forward search
# -----------------------------------------------------------------------------
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Env Vars
# -----------------------------------------------------------------------------

HISTFILE=$CACHE/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Add timestamps
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac




