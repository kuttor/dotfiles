# ==============================================================================
# -- zsh options ---------------------------------------------------------------
# ==============================================================================

# -- prompt and completion --
unsetopt promptcr        # Prevent overwriting non-newline output at the prompt
setopt list_packed       # Compactly display completion list
setopt auto_remove_slash # Automatically remove trailing / in completions
setopt auto_param_slash  # Automatically append trailing / in directory name completion to prepare for next completion
setopt mark_dirs         # Append trailing / to filename expansions for folders.
setopt list_types        # Display file type identifier in list of possible completions (ls -F)
setopt auto_list         # Display a list of possible completions with ^I.
setopt auto_menu         # Automatically display a menu for completions.
setopt auto_param_keys   # Automatically completes bracket correspondence, etc.
setopt auto_resume       # Resume completion after command interruption.
setopt no_beep           # Don't beep on command input error.
setopt complete_in_word  # Complete in the middle of a word.
setopt equals            # Expand =COMMAND to COMMAND pathname.
setopt nonomatch         # Enable glob expansion to avoid nomatch.
setopt glob              # Enable glob expansion.
setopt extended_glob     # Enable expanded globs.

# Flow Control and Editor Options
unsetopt flow_control  # Disable C-s, C-q (in shell editor)
setopt no_flow_control # Do not use C-s/C-q flow control

# Directory Management Options
setopt path_dirs       # Find subdirectories in PATH when / is included in command name
setopt print_eight_bit # Display Japanese in completion candidate list properly
setopt short_loops     # Use simplified syntax for FOR, REPEAT, SELECT, IF, FUNCTION, etc.

# Directory Stack and Navigation Options
setopt auto_name_dirs
setopt pushd_ignore_dups # Delete old duplicates in the directory stack.
setopt pushd_to_home     # no pushd argument == pushd $HOME
setopt pushd_silent      # Don't show contents of directory stack on every pushd,popd
setopt pushdminus        # swap + - behavior

# File Management and Confirmation Options
setopt rm_star_wait         # confirm before rm * is executed
setopt notify               # Notify as soon as background job finishes (don't wait for prompt)
setopt interactive_comments # Allow comments while typing commands
setopt chase_links          # Symbolic links are converted to linked paths before execution
setopt nolistambiguous      # Show menu
