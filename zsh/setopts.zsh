#!/usr/bin/env zsh

# History
setopt BANG_HIST                 # '!' specially treated.
setopt EXTENDED_HISTORY          # History uses ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write immediately to file.
setopt SHARE_HISTORY             # All sessions share history.
setopt HIST_EXPIRE_DUPS_FIRST    # Duplicate entries expire first.
setopt HIST_IGNORE_DUPS          # Don't record dupes.
setopt HIST_IGNORE_ALL_DUPS      # Delete old entry if new is dupe.
setopt HIST_FIND_NO_DUPS         # Do not display dupes.
setopt HIST_IGNORE_SPACE         # Don't record space started entries.
setopt HIST_SAVE_NO_DUPS         # Dupes don't write to file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Navigation
setopt AUTO_CD                   # Auto inserts CD so you dont have to.

# Completion
setopt COMPLETE_IN_WORD          # Allows completion from mid-word.
setopt ALWAYS_TO_END             # Move to end of word after completion.
setopt PROMPT_SUBST              # Allow param exp,cmd exp, and math exp.
