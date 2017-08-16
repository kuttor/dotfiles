#! /bin/bash

# Author: Andrew Kuttor
# E-mail: andrew.kuttor@gmail.com

# =============================================================================
# History
# =============================================================================

# alias
alias h="history"

# shopt
shopt -s histappend # Always append to history file, don't overwrite
shopt -s histreedit # Allow editing after failed history substitution
shopt -s histverify # Verify expansion before execute

# export
export HISTSIZE=100000                            # History file size
export HISTFILESIZE=$HISTSIZE                     # History limit
export HISTCONTROL=ignoredups:erasedups           # Ignore lead-space & dupes
export HISTTIMEFORMAT="[%F %T] "                  # Custom time format
export HISTIGNORE="ls:cd::pwd:exit:history:clear" # Ignore recording commands

# Better save history logic
PROMPT_COMMAND='history -a;history -n'
