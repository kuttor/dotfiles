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
# Dotfiles | Envrionment Setup
# =============================================================================

# -- Dotfiles Array --
declare -A DOTFILES
DOTFILES[HOME_DIR]="${HOME}/.dotfiles"
DOTFILES[AUTOLOADS]="${HOME}/.dotfiles/autoloads"
DOTFILES[CONFIGS]="${HOME}/.dotfiles/configs"
DOTFILES[HOOKS]="${HOME}/.dotfiles/hooks"

# -- Dotfiles Array Shorteners --
export HOME_DIR="${DOTFILES[HOME_DIR]}"
export AUTOLOADS="${DOTFILES[AUTOLOADS]}"
export CONFIGS="${DOTFILES[CONFIGS]}"
export HOOKS="${DOTFILES[HOOKS]}"

# -- XDG Base Directories --
export XDG_CONFIG_HOME="${HOME}/.local/config"; mkdir -p "${XDG_CONFIG_HOME}"
export XDG_RUNTIME_DIR="/tmp/$USER"; mkdir -p -m 0700 "${XDG_RUNTIME_DIR}"
export XDG_STATE_HOME="${HOME}/.local/state"; mkdir -p "${XDG_STATE_HOME}"
export XDG_CACHE_HOME="${HOME}/.local/cache"; mkdir -p "${XDG_CACHE_HOME}"
export XDG_DATA_HOME="${HOME}/.local/share"; mkdir -p "${XDG_DATA_HOME}"
export XDG_LIB_HOME="${HOME}/.local/lib"; mkdir -p "${XDG_LIB_HOME}"
export XDG_BIN_HOME="${LOCAL}/bin"; mkdir -p "${XDG_BIN_HOME}"

# -- XDG Base Arrays --
export XDG_CONFIG_DIRS="${XDG_CONFIG_HOME}":"${CONFIGS}":"${XDG_CONFIG_DIRS}"
export XDG_DATA_DIRS="${DATA}":"${XDG_DATA_DIRS}"
export XDG_BIN_DIRS="${XDG_BIN_HOME}:${XDG_BIN_DIRS}"

# -- XDG Shorteners --
export LOCAL_CONFIG="${XDG_CONFIG_HOME}"
export LOCAL_CACHE="${XDG_CACHE_HOME}"
export LOCAL_DATA="${XDG_DATA_HOME}"
export LOCAL_LIB="${XDG_LIB_HOME}"
export LOCAL_BIN="${XDG_BIN_HOME}"

# -- Homebrew Environment --
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"

# -- Homebrew Options --
HOMEBREW_NO_ENV_HINT=1

# -- Homebrew Paths Additions --
export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:${PATH+:$PATH}"
export MANPATH="${HOMEBREW_PREFIX}/share/man:${MANPATH+:$MANPATH}:"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"

# -- Zsh Configs Path --
export ZDOTDIR="${CONFIGS}/zsh"

# -- Help Files --
export HELPDIR="${HOMEBREW_PREFIX}/share/zsh/help"; mkdir -p "${HELPDIR}"
alias help="run-help"

# -- Basic Zinit Location --
export ZINIT_HOME="${LOCAL_DATA}/zinit/zinit.git"; mkdir -p "${ZINIT_HOME}"
export ZPFX="${LOCAL_DATA}/zinit/polaris"; mkdir -p "${ZPFX}"

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


# -- Data Relocations --
typeset _ZO_DATA_DIR="${LOCAL_DATA}"
typeset CARGO_HOME="${LOCAL_DATA}/cargo"

# -- Config Relocations --
typeset INPUTRC="${CONFIGS}/inputrc"
typeset WGETRC="${CONFIGS}/wgetrc"
typeset BAT_CONFIG_PATH="${CONFIGS}/bat.conf"
typeset EXA_CONFIG_PATH="${CONFIGS}/exa.conf"
typeset EZA_CONFIG_PATH="${CONFIGS}/exa.conf"
typeset FZF_CONFIG_PATH="${CONFIGS}/fzf.conf"
typeset RPGREP_CONFIG_PATH="${CONFIGS}/ripgreprc"
typeset EDITORCONFIGRC="${CONFIGS}/.editorconfigrc"
typeset POWERLEVEL9K_CONFIG_FILE="${CONFIGS}/.p10k.zsh"
typeset POWERLEVEL10K_CONFIG_FILE="${CONFIGS}/.p10k.zsh"
# Tmux
typeset TMUX_TEMPDIR="${LOCAL_CACHE}/tmux"

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
export FZF_BASE="${CONFIGS}/fzf.conf"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--cycle --reverse --no-height  --exit-0 --bind=ctrl-j:accept --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'

# FZ
FZ_HISTORY_CD_CMD="z"

# History
[[ -z "$HISTFILE" ]] && HISTFILE="${LOCAL_CACHE}/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=10000
export SAVEHIST=10000

# =============================================================================
# Zsh Config Sourcing
# =============================================================================

source "${ZDOTDIR}/paths.zsh"
source "${ZDOTDIR}/autoloads.zsh"
source "${ZDOTDIR}/options.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/modules.zsh"
source "${ZDOTDIR}/keybindings.zsh"
