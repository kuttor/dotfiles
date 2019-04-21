#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0 foldmethod=marker:

# file: env.zshv
# info: Main config file for env variables

# VIP Folders
DOTFILES="$HOME/.dotfiles"
BREW_HOME="$(brew --prefix)"
CACHE="$HOME/.cache"
CONFIG="$HOME/.config"
ZPLUG_HOME="$HOME/.zplug"
ZFUNCTIONS="$DOTFILES/functions"

# Set Opts
setopt   AUTO_CD                # Navigate without typing cd
setopt   CDABLE_VARS            # path stored in a variable
setopt   CHASE_LINKS            # resolve links to their location
setopt   HASH_CMDS              # dont search for commands
setopt   HASH_LIST_ALL          # more accurate correction
setopt   INTERACTIVE_COMMENTS   # Allow comments in readlin
setopt   LIST_ROWS_FIRST        # rows are way better
setopt   LIST_TYPES             # Append type chars to files
setopt   MULTIOS                # Write to multiple descriptors
setopt   NOTIFY                 # Report status of bkground jobs right now
setopt   PROMPT_SUBST           # Enable param and arithmetic substitution
setopt   RC_QUOTES              # Allow 'Henry''s Garage'
setopt   SHORT_LOOPS            # Sooo lazy: for x in y do cmd
setopt   SUN_KEYBOARD_HACK      # ignore rogue backquote
unsetopt FLOW_CONTROL           # Disable start/stop characters editor

# Colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=52;30'
export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  source `brew --prefix`/etc/grc.bashrc
fi

# Automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# Autoload all function files
for f in $ZFUNCTIONS/*; do
  unhash -f $f 2>/dev/null
  autoload +X $f
done

# Function Paths
fpath=(
  ${BREW_HOME}/share/zsh-completions
  ${DOTFILES}/functions
  ${fpath}
)

# System Paths
path=(
  # ${HOME}/Library/Python/2.7/bin(N-/)
  # ${HOME}/Library/Python/3.7/bin(N-/)
  /usr/local/lib/python3.7/site-packages
  /usr/local/lib/python2.7/site-packages
  ${BREW_HOME}/opt/gems/bin(N-/)
  ${BREW_HOME}/{bin,sbin}(N-/)
  /usr/{bin,sbin}(N-/)
  /{bin,sbin}(N-/)
  ${path}
)

# Terminal
export REPORTTIME=2
export TIMEFMT="%U user %S system %P cpu %*Es total"
export KEYTIMEOUT=1
export TERMINAL_DARK=1
export ITERM_24BIT=1
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export _Z_DATA="$CONFIG/z-data"

# Homebrew
export HOMEBREW_GITHUB_API_TOKEN=aed27538de34dd4e7df7d5672c538f693f1109a0
#export GITHUB_ACCESS_TOKEN=$(pass github/access)
#export HOMEBREW_GITHUB_API_TOKEN=$(pass github/homebrew)

# Editor
export EDITOR=$(which nvim)
export VISUAL="$EDITOR"

# Pager
export PAGER=$(which bat)
export MANPAGER=$PAGER
export BAT_CONFIG_PATH="$DOTFILES/bat.conf"

# Tree
command -v tree > /dev/null &&\
  export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS --preview 'tree -C {} |\
  head -$LINES'"

# Emacs
bindkey -e

# Readline $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# Space does history expansion
bindkey " " magic-space

# Expand waiting to complete dots
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# FN + Arrow keys
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[1;2H" backward-word
bindkey "^[[1;2F" forward-word


# -----------------------------------------------------------------------------

source $(brew --prefix)/opt/fzf/shell/completion.zsh

FZF_DEFAULT_OPTS="
  --extended-exact
  --cycle
  --reverse"

FZF_DEFAULT_OPTS+="
  --bind pgup:preview-up
  --bind pgdn:preview-down
  --bind ctrl-f:jump
  --bind ctrl-k:kill-line
  --bind ctrl-p:toggle-preview
  --bind ctrl-a:select-all"

FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

# Add <TAB> completion handlers for fzf *after* fzf is loaded
_fzf_complete_z() { _fzf_complete '--multi --reverse' "$@" < <(raw_z) }

# Use rg to generate file completions
_fzf_compgen_path() { rg --files "$1" | with-dir "$1" }

# Use rg to generate the list for directory completion
_fzf_compgen_dir() { rg --files "$1" | only-dir "$1"i }

# z.lua
# -----------------------------------------------------------------------------
#eval "$(lua $ZPLUG_REPOS/skywind3000/z.lua/z.lua --init zsh)"
_ZL_CMD="y"                      # command alias
_ZL_DATA="$CONFIG/zdatafile.lua" # datafile location
_ZL_ECHO=1                       # Echo dirname after CD
_ZL_MATCH_MODE=1                 # Enable enhanced master
