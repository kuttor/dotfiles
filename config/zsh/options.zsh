#! /usr/bin/env zsh

# ==============================================================================
# -- options -------------------------------------------------------------------
# ==============================================================================

# -- prompt and completion --
setopt append_history         # allow multiple sessions to one history
setopt auto_list              # list possible completions with ^i
setopt auto_menu              # auto-display a menu for completions
setopt auto_name_dirs         # auto-name dirs in the dir stack
setopt auto_param_keys        # auto-completes bracket correspondence
setopt auto_param_slash       # auto-append trailing / in dir comps
setopt auto_remove_slash      # auto-remove trailing / in completions
setopt auto_resume            # resume completion after command interruption
setopt chase_links            # convert symlinks to linked paths before exec
setopt complete_in_word       # complete in the middle of a word
setopt equals                 # expand =command to command pathname
setopt extended_glob          # enable expanded globs
setopt extended_history       # show timestamp in history
unsetopt flow_control         # disable c-s, c-q (in shell editor)
setopt glob                   # enable glob expansion
setopt hist_expire_dups_first # expire dupes first when trimming history
setopt hist_find_no_dups      # do not display a previously found event
setopt hist_ignore_all_dups   # remove older duplicate entries from history
setopt hist_ignore_dups       # do not record already recorded events
setopt hist_ignore_space      # do not record an event starting with a space
setopt hist_reduce_blanks     # remove superfluous blanks from history items
setopt hist_save_no_dups      # don't write dupes to history file
setopt hist_verify            # don't  execute immediately on history expansion
setopt inc_append_history     # immediately write to history in realtime
setopt interactive_comments   # allow comments during commands
setopt list_packed            # compactly display completion list
setopt list_types             # display filetype identifier in completion list
setopt mark_dirs              # append trailing / to dir expansion
setopt no_beep                # don't beep on command input error
setopt no_flow_control        # do not use c-s/c-q flow control
setopt nolistambiguous        # show menu
setopt nonomatch              # enable glob expansion to avoid nomatch
setopt notify                 # notify asap when bg job ends
setopt path_dirs              # find subdirs in path when / is included
setopt print_eight_bit        # print 8-bit characters in completion
unsetopt promptcr             # don't overwrit non-newline output atprompt
setopt prompt_subst           # pass escape sequence through prompt
setopt pushd_ignore_dups      # delete old duplicates in the dir stack
setopt pushd_silent           # no show contents of dir stack on pushd,popd
setopt pushd_to_home          # no pushd argument == pushd $home
setopt pushdminus             # swap + - behavior
setopt rm_star_wait           # confirm before rm * is executed
setopt share_history          # share history across many shell instances
setopt short_loops            # simplify syntax for, repeat, select, if, funcs

