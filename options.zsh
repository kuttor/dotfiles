#!/usr/local/bin/zsh
# File: setoptions
# Info: Zsh configuration file for setopt directives
# ---------------------------------------------------------------------------

# General
setopt AUTO_CONTINUE          # send CONT to disowned processes
setopt AUTO_RESUME            # running a suspended program
setopt CHECK_JOBS             # check jobs before exiting
setopt FUNCTION_ARGZERO       # $0 contains the function name
setopt INTERACTIVE_COMMENTS   # shell comments (for presenting)
setopt LIST_AMBIGUOUS
setopt MAGIC_EQUAL_SUBST
setopt NOFLOWCONTROL
setopt NOTIFY                 # report status of bg jobs pronto
setopt NO_BEEP                # beep is annoying
setopt PATH_DIRS              # add commands with slashes to path search
setopt RM_STAR_WAIT           # are you REALLY sure?
setopt SUN_KEYBOARD_HACK      # ignore rogue backquote
setopt ZLE                    # magic stuff

# Correction and Completion
setopt AUTO_LIST              # list if multiple matches
setopt AUTO_PARAM_KEYS        # smart insert spaces " "
setopt AUTO_MENU              # Second tab for menu behavior
setopt AUTO_PARAM_SLASH       # completed directory ends in /
setopt AUTO_REMOVE_SLASH      # remove extra slashes if needed
setopt COMPLETE_ALIASES
setopt ALWAYS_TO_END          # curser goes to end after complete
setopt COMPLETE_IN_WORD       # complete at cursor
setopt CORRECT                # autocorrect spelling errors of commands
setopt NOMATCH                # if no matches print error
setopt CORRECT_ALL            # autocorrect spelling errors of arguments
setopt AUTO_MENU              # show complete menu on multi tab press
unsetopt MENU_COMPLETE        # add first of multiple

# Globbing
setopt BARE_GLOB_QUAL         # can use qualifirs by themselves
setopt BRACE_CCL              # extended brace expansion
setopt EXTENDED_GLOB          # awesome globs
setopt LIST_TYPES             # append type chars to files
setopt MARK_DIRS              # glob directories end in "/"
setopt NO_CASE_GLOB           # lazy case
setopt NULL_GLOB              # don't err on null globs
setopt NUMERIC_GLOB_SORT      # sort globs numerically
setopt RC_EXPAND_PARAM        # globbing arrays

# History
setopt APPEND_HISTORY         # append is good, append!
setopt HIST_EXPIRE_DUPS_FIRST # kill the dups! kill the dups!
setopt HIST_FIND_NO_DUPS      # ignore all search duplicates
setopt HIST_IGNORE_DUPS       # ignore immediate duplicates
setopt HIST_IGNORE_SPACE      # ignore lines starting with " "
setopt HIST_NO_STORE          # don't store history commands
setopt HIST_REDUCE_BLANKS     # collapse extra whitespace
setopt INC_APPEND_HISTORY     # append in real time
setopt SHARE_HISTORY          # share history between terminals

# I/O and Syntax
setopt CDABLE_VARS            # in p, cd x ==> ~/x if x not p
setopt CHASE_LINKS            # resolve links to their location
setopt EQUALS                 # "=ps" ==> "/usr/bin/ps"
setopt HASH_CMDS              # don't search for commands
setopt HASH_LIST_ALL          # more accurate correction
setopt LIST_ROWS_FIRST        # rows are way better
setopt MULTIBYTE              # Unicode!
setopt MULTIOS                # redirect to globs!
setopt NOCLOBBER              # don't overwrite with > use !>
setopt SHORT_LOOPS            # sooo lazy: for x in y do cmd

# navigation
setopt AUTO_CD                # just "dir" instead of "cd dir"
setopt AUTO_NAME_DIRS         # if I set a=/usr/bin, cd a works
setopt AUTO_PUSHD             # push everything to the dirstack
setopt PUSHD_IGNORE_DUPS      # duplicates are redundant (duh)
setopt PUSHD_MINUS            # invert pushd behavior
setopt PUSHD_SILENT           # don't tell me though, I know.
setopt PUSHD_TO_HOME          # pushd == pushd ~
