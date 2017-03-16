#!/usr/bin/env zsh

# File: setopts
# Usage: Source file for Z-Shell Options
# Author: Andrew Kuttor

# Basics
setopt no_beep # don't beep on error
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)

# Changing Directories
setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt auto_pushd # Make cd push the old directory onto the directory stack.
setopt cdablevarS # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack

# Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation
setopt glob_dots # Do not require a leading '.' in a filename to be matched explicitly.

# History
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history # save timestamp of command and duration
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt hist_verify # don't execute, just expand history
setopt share_history # imports new commands and appends typed commands to history

# Completion 
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word    
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word # Allow completion from within a word/phrase
setopt auto_param_slash
setopt menu_complete # Autoselect the first completion entry

# Input/Output
setopt correct_all # spelling correction for arguments
setopt correct # spelling correction for commands
setopt clobber # Force direction arrows to work like bash
setopt aliases # Expand aliases
setopt short_loops # Allow short forms: for, repeat, select, if

# Initialization
unsetopt global_rcs # Only source .zshenv on startup
setopt traps_async

# Prompt
setopt prompt_subst # Allow param, cmd, & math expansion in prompt
# setopt transient_rprompt # only show the rprompt on the current prompt

# Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted
