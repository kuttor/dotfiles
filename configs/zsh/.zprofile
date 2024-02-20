#! /opt/homebrew/bin/zsh
# vim:set filetype=zsh syntax=zs
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab nu clipboard+=unnamedplus foldmethsofttabstop=0
# Vim:set nu clipboard+=unnamedplus foldmethsofttabstop=0

# =============================================================================
# ENV VARS: Terminal Setup
# ============================================================================\=

export COLUMNS ROW

# Fix for password store
export PASSWORD_STORE_GPG_OPTS="--no-throw-keyids --use-agent"

# =============================================================================
# VARS | Dotfiles
# =============================================================================

declare -A DOTFILES
DOTFILES[HOME_DIR]="${HOME}/.dotfiles"
DOTFILES[CONFIGS]="${HOME}/.dotfiles/configs"
DOTFILES[HOOKS]="${DOTFILES[HOME_DIR]}/hooks"
DOTFILES[FUNCTIONS]="${DOTFILES[HOME_DIR]}/functions"
DOTFILES[AUTOLOADS]="${DOTFILES[HOME_DIR]}/autoloads"

# =============================================================================
# VARS | XDG Base Directory Specification
# =============================================================================
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

# -- Conf --
export XDG_CONFIG_HOME="{$XDG_CONFIG_HOME}:-${HOME}/config"
export XDG_CONFIG_DIRS="${XDG_CONFIG_HOME}":"${CONFIGS}":"${XDG_CONFIG_DIRS}"

# -- Data -- Stores user-specific package
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_DATA_DIRS="${XDG_DATA_HOME}":"${XDG_DATA_DIRS}"

# -- Lib, Cache, State, Runtime --
export XDG_LIB_HOME="${HOME}/.local/libs" && mkdir -p "${XDG_LIB_HOME}"
export XDG_CACHE_HOME="${HOME}/.local" && mkdir -p "${XDG_CACHE_HOME}"
export XDG_STATE_HOME="${HOME}/.local" && mkdir -p "${XDG_STATE_HOME}"
export XDG_RUNTIME_DIR="${HOME}/tmp/.local zsh-${UID}"

# -- Bin --
export XDG_BIN_HOME="${BIN}"
export XDG_BIN_DIRS="${XDG_BIN_HOME}:${XDG_BIN_DIRS}}"

# =============================================================================
# VARS | Misc
# =============================================================================

# -- Commons Shorteners -- CONFIG. CACHE, LOCAL
export LOCAL="${HOME}/.local" && mkdir -p "${LOCAL}"
export CONFIG="${LOCAL}/.config" && mkdir -p "${CONFIG}"
export CACHE="${LOCAL}/.cache" && mkdir -p "${CACHE}"
export LIB="${LOCAL}/lib" && mkdir -p "${LIB}"
export BIN="${LOCAL}/bin" && mkdir -p "${BIN}"


# ==V===========================================================================
# VARS | Homebrew
# =============================================================================

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# ==V===========================================================================
# VARS | Zsh
# =============================================================================

# Specify custom Zsh dotfilez directory
export ZDOTDIR="${DOTFILES[HOME_DIR]}/configs/zsh" && mkdir -p "${ZDOTDIR}"

# Specify help files directory
export HELPDIR="${HOMEBREW_PREFIX}/share/zsh/help" && mkdir -p "${HELPDIR}"


# =============================================================================
# VARS | Zinit
# =============================================================================

# Set DOTFILES environment variables

export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
export ZPFX="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/polaris"

declare -A ZINIT
ZINIT[BIN_DIR]="${ZINIT_HOME}"
ZINIT[HOME_DIR]="${ZINIT_HOME:-}"
ZINIT[MAN_DIR]="${ZINIT_HOME}/man"
ZINIT[PLUGIN_DIR]="${ZINIT_HOME}/plugins"
ZINIT[SNIPPETS_DIR]="${ZINIT_HOME}/snippets"
ZINIT[COMPLETIONS_DIR]="${ZINIT_HOME}/completions"
ZINIT[ZCOMPDUMP_PATH]="${ZINIT_HOME}/zcompdump"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]='1'
ZINIT[COMPINIT_OPTS]=' -C'
ZINIT[NO_ALIASES]='0'

# =============================================================================
# ENV-VARS: Config Relocations
# =============================================================================

typeset POWERLEVEL9K_CONFIG_FILE="$DOTFILES[CONFIGS]/.p10k"
typeset EDITORCONFIGRC="${XDG_CONFIG_HOME}/.editorconfigrc"
typeset RPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/ripgreprc"
typeset FZF_CONFIG_PATH="${XDG_CONFIG_HOME}/fzf.conf"
typeset EXA_CONFIG_PATH="${XDG_CONFIG_HOME}/exa.conf"
typeset BAT_CONFIG_PATH="${XDG_CONFIG_HOME}/bat.conf"
typeset TMUX_TEMPDIR="$XDG_RUNTIME_DIR/tmux"
typeset INPUTRC="${XDG_CONFIG_HOME}/inputrc"
typeset _ZO_DATA_DIR="${XDG_DATA_HOME}/"
typeset CARGO_HOME="${XDG_DATA_HOME}/cargo"
typeset WGETRC="${XDG_CONFIG_HOME}/wgetrc"

# =============================================================================
#  Paths
# =============================================================================

# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH=(
  /opt/homebrew/lib/pkgconfig
  $PKG_CONFIG_PATH
)
#  Zsh-Autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
export ZSH_AUTOSUGGEST_USE_ASYNC="1"
export ZSH_AUTOSUGGEST_MANUAL_REBIND="1"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="1"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion pre_)

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
export BAT_PAGER="less"

# Ruby
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# Homebrew
export HOMEBREW_CACHE="${CACHE}/homebrew"

# GIT
GITSTATUS_LOG_LEVEL=DEBUG


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
[[ -z "$HISTFILE" ]] && HISTFILE="${CACHE}/.zsh_history"
export ZSH_PECO_HISTORY_OPTS="--layout=bottom-up --initial-filter=Fuzzy"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=10000
export SAVEHIST=10000

