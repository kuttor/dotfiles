#!/usr/local/bin/zsh
# File: setoptions
# Info: Zsh configuration file for setopt directives
# ---------------------------------------------------------------------------



setopt   AUTO_CD                # Change to a directory without typing cd
setopt   AUTO_PUSHD             # Push the old directory onto the stack on cd
setopt   CDABLE_VARS            # Change directory to a path stored in a variable
setopt   CHASE_LINKS            # resolve links to their location
setopt   HASH_CMDS              # dont search for commands
setopt   HASH_LIST_ALL          # more accurate correction
setopt   INTERACTIVE_COMMENTS   # Allow comments in readlin
setopt   LIST_ROWS_FIRST        # rows are way better
setopt   LIST_TYPES             # Append type chars to files
setopt   MULTIOS                # Write to multiple descriptors
setopt   NOTIFY                 # Report status of background jobs immediately
setopt   PROMPT_SUBST           # Enable param/arithmetic expansion, cmd substitution
setopt   PUSHD_IGNORE_DUPS      # Do not store duplicates in the stack
setopt   RC_QUOTES              # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
setopt   SHORT_LOOPS            # Sooo lazy: for x in y do cmd
setopt   SUN_KEYBOARD_HACK      # ignore rogue backquote
unsetopt FLOW_CONTROL           # Disable start/stop characters in shell editor
unsetopt HUP                    # Dont kill jobs on shell exit



