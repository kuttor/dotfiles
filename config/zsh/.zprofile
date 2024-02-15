#! /opt/homebrew/bin/zsh
# vim:set filetype=zsh syntax=zs
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab nu clipboard+=unnamedplus foldmethsofttabstop=0
# Vim:set nu clipboard+=unnamedplus foldmethsofttabstop=0

# =============================================================================
# ENV VARS: Terminal Setup
# =============================================================================

export COLUMNS ROW

# Fix for password store
export PASSWORD_STORE_GPG_OPTS="--no-throw-keyids --use-agent"

# =============================================================================
# ENV-VARS: Zinit based configurations

ZINIT_HOME="/opt/zinit/zinit.git"

# =============================================================================
# ENV VARS: DOTFILES Repo
# =============================================================================

# Set DOTFILES environment variables
typeset -gAHx DOTFILES
DOTFILES[HOME]="${HOME}/.dotfiles"
DOTFILES[CONFIG]="${DOTFILES[HOME]}/config"
DOTFILES[FUNCTIONS]="${DOTFILES[HOME]}/functions"
DOTFILES[HOOKSCRIPTS]="${DOTFILES[HOME]}/hookscripts"
DOTFILES[ATINIT]="${DOTFILES[HOOKSCRIPTS]}/atini"
DOTFILES[ATPULL]="${DOTFILES[HOOKSCRIPTS]}/atpull"
DOTFILES[ATCLONE]="${DOTFILES[HOOKSCRIPTS]}/atclone"
DOTFILES[ATLOAD]="${DOTFILES[HOOKSCRIPTS]}/atload"

# =============================================================================
# ENV VARS: XDG
# =============================================================================

# Config
export XDG_CONFIG_HOME="${DOTFILES[HOME]}/config"
export XDG_CONFIG_DIRS=${XDG_CONFIG_HOME}:${XDG_CONFIG_DIRS}

# Data
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS}

# Misc
export XDG_LIB_HOME="${HOME}/.local/lib" && mkdir -p "${XDG_LIB_HOME}"
export XDG_CACHE_HOME="${HOME}/.local/.cache" && mkdir -p "${XDG_CACHE_HOME}"
export XDG_STATE_HOME="${HOME}/.local/state" && mkdir -p "${XDG_STATE_HOME}"
export XDG_RUNTIME_DIR="/tmp/zsh-${UID}"
# Bin"
export XDG_BIN_HOME="${HOME}/.local/bin/"
export XDG_BIN_DIRS="${XDG_BIN_HOME}:${XDG_BIN_DIRS}}"

# =============================================================================
# ENV-VARS: Zshell Customization
# =============================================================================c

# Specify custom Zsh dotfilez directory
ZDOTDIR="${DOTFILES[HOME]}/config/zsh" && mkdir -p "${ZDOTDIR}"

# Specify help files directory
HELPDIR="/opt/homebrew/share/zsh/help"

# =============================================================================
# ENV-VARS: Config Relocations
# =============================================================================

typeset RPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/ripgreprc"
typeset FZF_CONFIG_PATH="${XDG_CONFIG_HOME}/fzf.conf"
typeset EXA_CONFIG_PATH="${XDG_CONFIG_HOME}/exa.conf"
typeset INPUTRC="${XDG_CONFIG_HOME}/inputrc"
typeset EDITORCONFIGRC="${XDG_CONFIG_HOME}/.editorconfigrc"
typeset CARGO_HOME="${XDG_DATA_HOME}/cargo"
typeset BAT_CONFIG_PATH="${XDG_CONFIG_HOME}/bat.conf"
typeset TMUX_TEMPDIR="$XDG_RUNTIME_DIR/tmux"
typeset WGETRC="${XDG_CONFIG_HOME}/wgetrc"

# =============================================================================
# ENV-VARS: Homebrew
# =============================================================================

export HOMEBREW_PREFIX="/opt/homebrew"
export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export H="/opt/homebrew/share/info:${INFOPATH:-}"

# =============================================================================
#  Paths
# =============================================================================

typeset -Ux path PATH
typeset -Ux fpath FPATH
typeset -Ux cdpath CDPATH
typeset -Ux manpath MANPAT H
declare -a pkg_config_path PKG_CONFIG_PATH

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/${USER}/.local/bin:/Users/${USER}/Library/Python/3.7/bin:/Users/${USER}/Library/Python/3.8/bin:/Users/${USER}/Library/Python/3.9/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH"

# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH=(
  /opt/homebrew/lib/pkgconfig
  $PKG_CONFIG_PATH
)

# Load Custom Functions
fpath=(
  "/opt/homebrew/share/zsh/site-functions"
  "${DOTFILES[FUNCTIONS]}"
  "$fpath"
)
autoload -Uz "${fpath[@]}"

#  Zsh-Autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
export ZSH_AUTOSUGGEST_USE_ASYNC="1"
export ZSH_AUTOSUGGEST_MANUAL_REBIND="1"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="1"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Terminal
export REPORTTIME="2"
export TIMEFMT="%U user %S system %P cpu %*Es total"
export KEYTIMEOUT="1"
export ITERM_24BIT="1"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"

# Editor
export EDITOR="nvim"
export PAGER="less"
export VISUAL="$EDITOR"

# Python
export PYTHONDONTWRITEBYTECODE=true
export PYTHONSTARTUP="$HOME/.python_startup.py"

# Pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_CONFIG_PATH="${DOTFILES[CONFIG_DIR]}/bat.conf"

# Ruby
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# Homebrew
export HOMEBREW_CACHE="${CACHE}/homebrew"

# FZF
export FZF_BASE="${XDG_CONFIG_HOME}/fzf.conf"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--cycle --reverse --no-height  --exit-0 --bind=ctrl-j:accept --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'

# Zlua
#[[ ! -f "${CACHE}/z.lua" ]]  touch "${CACHE}/z.lua"
export _ZL_DATA="$CACHE/z.lua"
export _ZL_MATCH_MODE="1"
export _ZL_HYPHEN="1"
export _ZL_ECHO="1"

# FZ
FZ_HISTORY_CD_CMD="_zlua"

# History
[[ -z "$HISTFILE" ]] && HISTFILE="${CACHE}.zsh_history"
export ZSH_PECO_HISTORY_OPTS="--layout=bottom-up --initial-filter=Fuzzy"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=10000
export SAVEHIST=10000

bindkey " " magic-space
bindkey "^E" edit-command-line
bindkey "^I" unambigandmenu
# bindkey "^I" expand-or-complete-with-dots
bindkey "^N" history-beginning-search-forward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^X^L" insert-last-command-output
bindkey "^[[1;2C" forward-word
bindkey "^[[1;2D" backward-word
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey -e
