#!/usr/local/bin/zsh
# File: setoptions
# Info: Zsh configuration file for setopt directives
# ---------------------------------------------------------------------------

# Navigation
setopt   AUTO_CD                # Change to a directory without typing cd
setopt   AUTO_PUSHD             # Push the old directory onto the stack on cd
setopt   CDABLE_VARS            # Change directory to a path stored in a variable
setopt   EXTENDED_GLOB          # Use extended globbing syntax
setopt   MULTIOS                # Write to multiple descriptors
setopt   PUSHD_IGNORE_DUPS      # Do not store duplicates in the stack
setopt   PUSHD_SILENT           # Do not print the directory stack after pushd or popd
setopt   PUSHD_TO_HOME          # Push to home directory when no argument is given
unsetopt CLOBBER                # Dont overwrite existing files with > and >>

# Files and Commands
setopt   BRACE_CCL              # Allow brace character class list expansion
setopt   CDABLE_VARS            # in p, cd x ==> ~/x if x not p
setopt   CHASE_LINKS            # resolve links to their location
setopt   COMBINING_CHARS        # Combine zero-length punctuation characters (accents) with the base character
setopt   CORRECT                # Correct mis-typed commands
setopt   HASH_CMDS              # dont search for commands
setopt   HASH_LIST_ALL          # more accurate correction
setopt   LIST_ROWS_FIRST        # rows are way better
setopt   LIST_TYPES             # Append type chars to files
setopt   MULTIBYTE              # Unicode!
setopt   MULTIOS                # redirect to globs!
setopt   RC_QUOTES              # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
setopt   SHORT_LOOPS            # Sooo lazy: for x in y do cmd
setopt   SUN_KEYBOARD_HACK      # ignore rogue backquote
setopt INTERACTIVE_COMMENTS
unsetopt MAIL_WARNING           # Dont print a warning message if a mail file has been accessed


# Jobs
setopt   AUTO_RESUME            # Attempt to resume existing job before creating a new process
setopt   LONG_LIST_JOBS         # List jobs in the long format by default
setopt   NOTIFY                 # Report status of background jobs immediately
unsetopt BG_NICE                # Dont run all background jobs at a lower priority
unsetopt CHECK_JOBS             # Dont report on jobs when shell exit
unsetopt HUP                    # Dont kill jobs on shell exit

# History
setopt   APPEND_HISTORY         # append is good, append!
setopt   BANG_HIST              # Treat the '!' character specially during expansion
setopt   HIST_BEEP              # Beep when accessing non-existent history
setopt   HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history
setopt   HIST_FIND_NO_DUPS      # Do not display a previously found event
setopt   HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate
setopt   HIST_IGNORE_DUPS       # Do not record an event that was just recorded again
setopt   HIST_IGNORE_SPACE      # Do not record an event starting with a space
setopt   HIST_REDUCE_BLANKS     # collapse extra whitespace
setopt   HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file
setopt   HIST_VERIFY            # Do not execute immediately upon history expansion
setopt   INC_APPEND_HISTORY     # append in real time
setopt   SHARE_HISTORY          # Share history between all sessions

# Completion
setopt   ALWAYS_TO_END          # curser goes to end after complete
setopt   AUTO_LIST              # Automatically list choices on ambiguous completion
setopt   AUTO_MENU              # Second tab for menu behavior
setopt   AUTO_PARAM_KEYS        # smart insert spaces " "
setopt   AUTO_PARAM_SLASH       # If completed parameter is a directory, add a trailing slash
setopt   AUTO_REMOVE_SLASH      # remove extra slashes if needed
setopt   COMPLETE_ALIASES
setopt   COMPLETE_IN_WORD       # Complete from both ends of a word
setopt   CORRECT                # autocorrect spelling errors of commands
unsetopt   CORRECT_ALL            # autocorrect spelling errors of arguments
setopt   NOMATCH                # if no matches print error
setopt   PATH_DIRS              # Perform path search even on command names with slashes
unsetopt MENU_COMPLETE          # add first of multiple
unsetopt CASE_GLOB              # Make globbing case insensitive
unsetopt FLOW_CONTROL           # Disable start/stop characters in shell editor
