#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0 foldmethod=marker:

# file: env.zshv
# info: Main config file for env variables

# VIP Folders
DOTFILES="$HOME/.dotfiles"
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



# Terminal
export REPORTTIME=2
export TIMEFMT="%U user %S system %P cpu %*Es total"
export KEYTIMEOUT=1
export ITERM_24BIT=1
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export _Z_DATA="$CONFIG/z-data"

# Editor
export EDITOR="/usr/local/bin/nvim"
export VISUAL="$EDITOR"

# Pager
export PAGER="/usr/local/bin/bat"
export MANPAGER=$PAGER
export BAT_CONFIG_PATH="$DOTFILES/bat.conf"

# -----------------------------------------------------------------------------
# Paths
# -----------------------------------------------------------------------------

# Automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# Autoload all function files
#/for f in $ZFUNCTIONS/*; do
#  unhash -f $f 2>/dev/null
#  autoload +X $f
#done

autoload $(ls $ZFUNCTIONS)

# Function Paths
fpath=(
  #/usr/share/zsh-completions
  ${DOTFILES}/functions
  ${fpath}
)

# System Paths
path=(
  /Users/${USER}/Library/Python/{2.7,3.7}/lib/python/site-packages(N-/)
  /Users/${USER}/Library/Python/{2.7,3.7}/bin
  /usr/local/Cellar/coreutils/8.31/libexec/gnubin
  /usr/local/{bin,sbin}(N-/)
  /usr/{bin,sbin}(N-/)
  /{bin,sbin}(N-/)
  ${path}
)

# -----------------------------------------------------------------------------
# Colors
# -----------------------------------------------------------------------------

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=52;30'
export EXA_COLORS="README*=38;5;208:Makefile=33"
export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1
eval `dircolors ~/Code/bliss-dircolors/bliss.dircolors`

# -----------------------------------------------------------------------------
# Keybinds
# -----------------------------------------------------------------------------

# Emacs
bindkey -e

# Quote pasted URLs
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn
autoload -U url-quote-magic
autoload -U select-word-style
autoload -U edit-command-line
autoload -Uz colors && colors
autoload -U parseopts
autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv

zle -N select-word-style bash
zle -N edit-command-line
zle -N expand-or-complete-with-dots
zle -N self-insert url-quote-magic

bindkey "^E"      edit-command-line
bindkey "^I"      expand-or-complete-with-dots
bindkey " "       magic-space
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[Z"    autosuggest-accept
bindkey "^[[1;2D" backward-word
bindkey "^[[1;2C" forward-word

# Make capslocks an escape
setxkbmap -option caps:backspace

