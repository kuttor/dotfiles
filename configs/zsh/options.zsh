#! /usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab nu clipboard+=unnamedplus foldmethsofttabstop=0

# =============================================================================
# Set Options
# =============================================================================
setopt ALIASES                # list all aliases.
#setopt AUTO_CD                # Navigate without typing cd.
setopt AUTO_PARAM_SLASH       # auto / directories
setopt BANG_HIST              # Treat '!' char specially during expansion.
setopt CHASE_LINKS            # Resolve links to their location.
setopt CORRECT                # Correct spelling
setopt CORRECT_ALL            # Correct spelling of all arguments
setopt EXTENDED_HISTORY       # Use history ":start:elapsed;command" format.
#setopt EXTENDED_GLOB          # ‘#’, ‘~’ and ‘^’ allowed for filename gens.
setopt HASH_CMDS              # dont search for commands
setopt HASH_LIST_ALL          # more accurate correction
setopt HIST_EXPIRE_DUPS_FIRST # remove dupes first when trimming history.
setopt HIST_IGNORE_SPACE      # don't record starting with a space.
setopt HIST_REDUCE_BLANKS     # remove superfluous blanks before recording.
setopt HIST_SAVE_NO_DUPS      # don't write dupes in the history file.
setopt HIST_VERIFY            # don't execute immediately upon expansion.
setopt GLOB                   # Perform filename generation
setopt GLOB_COMPLETE          # generate matches as for completion like MENU_COMPLETE.
setopt GLOB_STAR_SHORT        # "**/*" = "**"  and ***/* = ***.
setopt KSH_TYPESET            # word splitting does not take place
#setopt PATH_DIRS              # the directory
setopt INC_APPEND_HISTORY     # write to the history file immediately.
setopt INTERACTIVE_COMMENTS   # allow comments in readline
setopt LIST_ROWS_FIRST        # rows are way better
setopt LIST_TYPES             # append type chars to files
setopt MULTIOS                # write to multiple descriptors
#setopt NO_CASE_GLOB           # insensitive GLOB
#setopt NO_CASE_MATCH          # insentive matching
#setopt PROMPT_SUBST           # enable param and arithmetic substitution
#setopt RC_QUOTES              # allow 'Henry''s Garage'
setopt RCS                    # zshenv,,zprofile,.zprofile|zshrc,.zshrc|zlogin,.zlogin|.zlogout
setopt SHARE_HISTORY          # share history between all sessions.
setopt SHORT_LOOPS            # for x in y do cmd
#setopt SUN_KEYBOARD_HACK      # ignore rogue backquote
unsetopt FLOW_CONTROL         # disable /stop characters editor