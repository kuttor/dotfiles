#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

# Dotfiles location
export DOTFILES="${HOME}/.dotfiles"

# Functions
fpath=( "${DOTFILES}/functions" "${fpath[@]}" ) 

# Language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Coloring
autoload -Uz colors && colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=9'
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'

# Editor
export EDITOR=`which nvim`
export VISUAL="${EDITOR}"
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# Pager
export PAGER='bat'
export MANPAGER='bat'
export BAT_CONFIG_PATH="${DOTFILES}/bat.conf"

# EnhancedCD
export ENHANCD_DOT_SHOW_FULLPATH=1
export ENHANCD_FILTER="fzf-tmux"

# Molecule
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# FSH
FAST_WORK_DIR="$HOME/.config/fsh"

# z.lua
_ZL_CMD="z"                             # command alias
_ZL_DATA="$HOME/.config/zdatafile.lua"  # datafile location
_ZL_CD="cdz"                            # Custom CD command.
_ZL_ECHO=1                              # Echo dirname after CD.
_ZL_MATCH_MODE=1                        # Enable enhanced matching.

# Sources
source "${DOTFILES}/aliases"
source "${DOTFILES}/functions"
source "${DOTFILES}/keybinds.zsh"
source "${DOTFILES}/zplug.zsh"
source "${DOTFILES}/zsh_autoloads"
source "${DOTFILES}/completes.zsh"
source "${DOTFILES}/zsh_history"
source "${DOTFILES}/options.zsh"
source "${HOME}/.iterm2_shell_integration.zsh"

