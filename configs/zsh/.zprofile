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
DOTFILES[HOOKS]="${HOME}/.dotfiles/hooks"
DOTFILES[AUTOLOADS]="${HOME}/.dotfiles/autoloads"

# =============================================================================
# VARS | XDG Base Directory Specification
# =============================================================================
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

# -- Local --
export LOCAL="${HOME}/.local"; mkdir -p "${LOCAL}"

# -- Configs --
export XDG_CONFIG_HOME="${HOME}/.config"
export CONFIGS="${DOTFILES[CONFIGS]}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_HOME}":"${CONFIGS}":"${XDG_CONFIG_DIRS}"

# -- Data --
export XDG_DATA_HOME="${LOCAL}/share"
export DATA="${XDG_DATA_HOME}"
export XDG_DATA_DIRS="${DATA}":"${XDG_DATA_DIRS}"

# -- Lib --
export XDG_LIB_HOME="${LOCAL}/lib"; mkdir -p "${XDG_LIB_HOME}"
export LIB="${XDG_LIB_HOME}"

# -- Cache --
export XDG_CACHE_HOME="${LOCAL}/cache"; mkdir -p "${XDG_CACHE_HOME}"
export CACHE="${XDG_CACHE_HOME}"; mkdir -p "${CACHE}"


export XDG_STATE_HOME="${HOME}/.local"; mkdir -p "${XDG_STATE_HOME}"
export XDG_RUNTIME_DIR="${HOME}/tmp/zsh-${UID}"

# -- Bin --
export XDG_BIN_HOME="${LOCAL}/bin"; mkdir -p "${XDG_BIN_HOME}"
export BIN="${XDG_BIN_HOME}"; mkdir -p "${BIN}"
export XDG_BIN_DIRS="${XDG_BIN_HOME}:${XDG_BIN_DIRS}"

# =============================================================================
# VARS | Homebrew
# =============================================================================

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="${HOMEBREW_CACHE}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_CACHE}"

export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:${PATH+:$PATH}"
export MANPATH="${HOMEBREW_PREFIX}/share/man:${MANPATH+:$MANPATH}:"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"

HOMEBREW_CACHE="${CACHE}/homebrew/cache"; mkdir -p "${HOMEBREW_CACHE}"
HOMEBREW_LOGS="${CACHE}/homebrew/logs"; mkdir -p "${HOMEBREW_LOGS}"
HOMEBREW_NO_ENV_HINT=1

# =============================================================================
# VARS | Zsh
# =============================================================================

# -- Zsh Configs Path --
export ZDOTDIR="${CONFIGS}/zsh"

# -- Help Files --
export HELPDIR="${HOMEBREW_PREFIX}/share/zsh/help"; mkdir -p "${HELPDIR}"
alias help="run-help"

# =============================================================================
# VARS | Zinit
# =============================================================================

# -- Basic Zinit Location --
export ZINIT_HOME="${DATA}/zinit/zinit.git"; mkdir -p "${ZINIT_HOME}"
export ZPFX="${DATA}/zinit/polaris"; mkdir -p "${ZPFX}"

#-- Env Vars --
# declare -A ZINIT
# ZINIT[BIN_DIR]="${ZINIT_HOME}"
# ZINIT[HOME_DIR]="${DATA}/zinit"
# ZINIT[MAN_DIR]="${ZPFX}/man"
# ZINIT[PLUGIN_DIR]="${DATA}/zinit/plugins"
# ZINIT[SNIPPETS_DIR]="${DATA}/zinit/snippets"
# ZINIT[COMPLETIONS_DIR]="${DATA}/zinit/completions"
# ZINIT[ZCOMPDUMP_PATH]="${CACHE}/zcompdump"
#
#ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]="1"
#ZINIT[MUTE_WARNINGS]="1"
#ZINIT[COMPINIT_OPTS]=" -C"
#ZINIT[NO_ALIASES]="0"

# =============================================================================
# ENV-VARS: Config Relocations
# =============================================================================

#typeset POWERLEVEL9K_CONFIG_FILE="$DOTFILES[CONFIGS]/.p10k"
typeset _ZO_DATA_DIR="${DATA}"
typeset BAT_CONFIG_PATH="${CONFIGS}/bat.conf"
typeset CARGO_HOME="${DATA}/cargo"
typeset EDITORCONFIGRC="${CONFIGS}/.editorconfigrc"
typeset EXA_CONFIG_PATH="${CONFIGS}/exa.conf"
typeset FZF_CONFIG_PATH="${CONFIGS}/fzf.conf"
typeset INPUTRC="${CONFIGS}/inputrc"
typeset RPGREP_CONFIG_PATH="${CONFIGS}/ripgreprc"
typeset TMUX_TEMPDIR="$XDG_RUNTIME_DIR/tmux"
typeset WGETRC="${CONFIGS}/wgetrc"

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

# -- Editors/Pagers --
export BAT_PAGER="less"
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="less"
export VISUAL="$EDITOR"

# Python
export PYTHONDONTWRITEBYTECODE=true
export PYTHONSTARTUP="$HOME/.python_startup.py"


# Ruby
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# GIT
GITSTATUS_LOG_LEVEL=DEBUG
GITSTATUS_SHOW_UNTRACKED_FILES="all"


# FZF
export FZF_BASE="${XDG_CONFIG_HOME}/fzf.conf"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--cycle --reverse --no-height  --exit-0 --bind=ctrl-j:accept --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'

# # Zlua
# #[[ ! -f "${CACHE}/z.lua" ]]  touch "${CACHE}/z.lua"
# export _ZL_DATA="$CACHE/z.lua"
# export _ZL_MATCH_MODE="1"
# export _ZL_HYPHEN="1"
# export _ZL_ECHO="1"

# FZ
FZ_HISTORY_CD_CMD="_zlua"

# History
[[ -z "$HISTFILE" ]] && HISTFILE="${CACHE}/.zsh_history"
export ZSH_PECO_HISTORY_OPTS="--layout=bottom-up --initial-filter=Fuzzy"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=10000
export SAVEHIST=10000
