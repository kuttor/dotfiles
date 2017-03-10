# Options can be found at: man zshoptions

# Config:Navigation
setopt AUTO_PUSHD # Use pushd instead of cd
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT # Do not show stack after cd
setopt PUSHD_TO_HOME # No args sends $HOME

# Config:Completions
setopt AUTO_LIST # List completions
setopt AUTO_MENU # TABx2 to start a tab complete menu
setopt NO_COMPLETE_ALIASES # Don't expand aliases before completion
setopt LIST_PACKED # Variable column widths

# Config:History
setopt APPEND_HISTORY # History file always appended to
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE # Don't save in history if space prefixed
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY # Verify when using history cmds/params

# Config:Misc
setopt ALIASES # Autocomplete alias switches
setopt AUTO_PARAM_SLASH # Auto-appends slash to directory
setopt CORRECT
setopt PROMPT_SUBST # Allow variables in prompt
setopt INTERACTIVE_COMMENTS # Allow comments in shell
setopt EXTENDED_GLOB # Like ** for recursive dirs
