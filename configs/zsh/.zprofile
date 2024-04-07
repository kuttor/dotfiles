#! /usr/bin/env zsh
# vim:set filetype=zsh syntax=zs
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab nu clipboard+=unnamedplus foldmethsofttabstop=0
# Vim:set nu clipboard+=unnamedplus foldmethsofttabstop=0

# ------------------------------------------------------------------------------
# ~ Pre-Config ~
# ------------------------------------------------------------------------------

# Skip the creation of global compinit
export skip_global_compinit=1

# Deprecating zshenv in favor for zprofile
[[ -f /etc/zshenv && -f /etc/zprofile ]] && sudo mv /etc/zshenv /etc/zprofile

# ------------------------------------------------------------------------------
# ~ Env-Vars ~
# ------------------------------------------------------------------------------

# Fix for password store
export PASSWORD_STORE_GPG_OPTS="--no-throw-keyids --use-agent"

# -- Dotfiles Array --
typeset -A DOTFILES
DOTFILES[FUNCTIONS]="${HOME}/.dotfiles/functions"
DOTFILES[CONFIGS]="${HOME}/.dotfiles/configs"
DOTFILES[HOOKS]="${HOME}/.dotfiles/hooks"
DOTFILES[HOME]="${HOME}/.dotfiles"

# -- Dotfiles Array Shorteners --
export FUNCTIONS="${DOTFILES[FUNCTIONS]}"
export CONFIGS="${DOTFILES[CONFIGS]}"
export HOOKS="${DOTFILES[HOOKS]}"

# -- XDG Base Directories --
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-${TMPPREFIX}}" && mkdir -p -m 0700 "${XDG_RUNTIME_DIR}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}" && mkdir -p "${XDG_STATE_HOME}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.local/cache}" && mkdir -p "${XDG_CACHE_HOME}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}" && mkdir -p "${XDG_CONFIG_HOME}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}" && mkdir -p "${XDG_DATA_HOME}"
export XDG_LIB_HOME="${XDG_LIB_HOME:-${HOME}/.local/lib}" && mkdir -p "${XDG_LIB_HOME}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-${HOME}/.local/bin}" && mkdir -p "${XDG_BIN_HOME}"

# -- XDG Base Arrays --
export XDG_CONFIG_DIRS="${XDG_CONFIG_HOME}":"${CONFIGS}":"${XDG_CONFIG_DIRS}"
export XDG_DATA_DIRS="${DATA}":"${XDG_DATA_DIRS}"
export XDG_BIN_DIRS="${XDG_BIN_HOME}":"${XDG_BIN_DIRS}"

# -- XDG Shorteners --
export LOCAL_CONFIG="${XDG_CONFIG_HOME}"
export LOCAL_CACHE="${XDG_CACHE_HOME}"
export LOCAL_DATA="${XDG_DATA_HOME}"
export LOCAL_LIB="${XDG_LIB_HOME}"
export LOCAL_BIN="${XDG_BIN_HOME}"

# -- Homebrew --
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
export HOMEBREW_NO_ENV_HINT=1
export HOMEBREW_NO_ANALYTICS=1

# -- Help Files --
export HELPDIR="${HOMEBREW_PREFIX}/share/zsh/help" && mkdir -p "${HELPDIR}"
alias help="run-help"

# -- Zsh Configs Path --
export ZDOTDIR="${CONFIGS}/zsh"
export ZDATADIR="${LOCAL_DATA}/zsh"
export ZCACHEDIR="${LOCAL_CACHE}/zsh"
export ZHOMEDIR="${ZDOTDIR}"
export ZRCDIR="${ZDOTDIR}"
export ZLIB="${ZDOTDIR}/lib"

# Zinit Custom Vars
export ZINIT_HOME="${LOCAL_DATA}/zinit/zinit.git" && mkdir -p "${ZINIT_HOME}"
export ZPFX="${LOCAL_DATA}/zinit/polaris" && mkdir -p "${ZPFX}"

# Zinit Builtins Vars
typeset -A ZINIT
ZINIT[ZCOMPDUMP_PATH]="${LOCAL_CACHE}/zcompdump"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]="1"
ZINIT[COMPINIT_OPTS]=" -C"
# ZINIT[BIN_DIR]="${ZINIT_HOME}"
# ZINIT[HOME_DIR]="${DATA}/zinit"
# ZINIT[MAN_DIR]="${ZPFX}/man"
# ZINIT[PLUGIN_DIR]="${DATA}/zinit/plugins"
# ZINIT[SNIPPETS_DIR]="${DATA}/zinit/snippets"
# ZINIT[COMPLETIONS_DIR]="${DATA}/zinit/completions"
# ZINIT[MUTE_WARNINGS]="1"

# -- Data Relocations --
export TMUX_PLUGIN_MANAGER_PATH="${LOCAL_DATA}/tmux/plugins"
export CARGO_HOME="${LOCAL_DATA}/cargo"
export GEM_HOME="${LOCAL_DATA}/gem"
export GOPATH="${LOCAL_DATA}/go"

# -- Config Relocations --eza
export CURL_HOME="${CONFIGS}/curl"
export LESSKEY="${CONFIGS}/less/lesskey"
export WGETRC="${CONFIGS}/wgetrc"
export INPUTRC="${CONFIGS}/inputrc"
export DOCKER_CONFIG="${CONFIGS}/docker"
export GIT_CONFIG="${CONFIGS}/git/config"
export BAT_CONFIG_PATH="${CONFIGS}/bat.conf"
export EXA_CONFIG_PATH="${CONFIGS}/exa.conf"
export EZA_CONFIG_PATH="${CONFIGS}/eza.conf"
export FZF_CONFIG_PATH="${CONFIGS}/fzf.conf"
export ZSH_TMUX_CONFIG="${CONFIGS}/tmux.conf"
export PIP_CONFIG_FILE="${CONFIGS}/pip/pip.conf"
export RPGREP_CONFIG_PATH="${CONFIGS}/ripgreprc"
export EDITORCONFIGRC="${CONFIGS}/.editorconfigrc"
export POWERLEVEL9K_CONFIG_FILE="${CONFIGS}/.p10k.zsh"
export POWERLEVEL10K_CONFIG_FILE="${CONFIGS}/.p10k.zsh"

# -- Local Cache Relocations --
export GEM_SPEC_CACHE="${LOCAL_CACHE}/gem"
export GITSTATUS_CACHE_DIR="${LOCAL_CACHE}/gitstatus"
export LESSHISTFILE="${LOCAL_CACHE}/less/history"
export NPM_CONFIG_CACHE="${LOCAL_CACHE}/npm"
export PIP_LOG_FILE="${LOCAL_CACHE}/pip/pip.log"
export TMUX_TEMPDIR="${LOCAL_CACHE}/tmux"

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
export LESSOPEN='| pygmentize -g %s'

# Python
export PYTHONDONTWRITEBYTECODE=true
export PYTHONSTARTUP="${CONFIGS}/python/.python_startup.py" && mkdir -p "${CONFIGS}/python"

# Ruby
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# GIT
GITSTATUS_LOG_LEVEL=DEBUG
GITSTATUS_SHOW_UNTRACKED_FILES="all"

# History
export HISTFILE="${LOCAL_CACHE}/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=10000
export SAVEHIST=10000

# Add the Zsh-Configs
source "${ZDOTDIR}/paths.zsh"
source "${ZDOTDIR}/autoloads.zsh"
source "${ZDOTDIR}/options.zsh"
source "${ZDOTDIR}/completions.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/modules.zsh"
source "${ZDOTDIR}/keybindings.zsh"

# ~ Source on MacOS only ~
#[[ ${OSTYPE} == "darwin"* ]] && source "${CONFIGS}/macos.zsh"
