#!/usr/local/bin/zsh
# vim:set ft=zsh ts=2 sw=2 sts=0 foldmethod=marker:

# file: env.zshv
# info: Main config file for env variables

# VIP Folders
DOTFILES="$HOME/.dotfiles"
BREW_HOME="$(brew --prefix)"
CACHE="$HOME/.cache"
CONFIG="$HOME/.config"
ZPLUG_HOME="/usr/local/opt/zplug"
ZFUNCTIONS="$DOTFILES/functions"

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
  ${HOME}/Library/Python/3.7/bin(N-/)
  ${BREW_HOME}/lib/python{2.7,3.7}/site-packages(N-/)
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
# export HOMEBREW_GITHUB_API_TOKEN=aed27538de34dd4e7df7d5672c538f693f1109a0
export GITHUB_ACCESS_TOKEN=$(pass github/access)
export HOMEBREW_GITHUB_API_TOKEN=$(pass github/homebrew)

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
