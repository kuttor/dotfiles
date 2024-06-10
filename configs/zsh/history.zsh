#!/usr/bin/env zsh
#vim:set syntax=zsh ft=zsh ts=2 sw=2 sts=0

# ==============================================================================
# -- history -------------------------------------------------------------------
# ==============================================================================

# -- options --
setopt append_history         # Allow multiple sessions to one history.
setopt extended_history       # Show timestamp in history.
setopt hist_expire_dups_first # Expire dupes first when trimming history.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_all_dups   # Remove older duplicate entries from history.
setopt hist_ignore_dups       # Do not record already recorded events.
setopt hist_ignore_space      # Do not record an Event Starting With A Space.
setopt hist_reduce_blanks     # Remove superfluous blanks from history items.
setopt hist_save_no_dups      # Do not write dupes to history file.
setopt hist_verify            # Do not execute immediately on history expansion.
setopt inc_append_history     # Immediately write to history in realtime.
setopt share_history          # Share history across many shell instances.

# -- history --
export HISTFILE="${XDG_CACHE_HOME}/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=10000
export SAVEHIST=10000
