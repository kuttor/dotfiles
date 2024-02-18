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
# ENV-VARS: kuttor/DOTFILES Repo Related
# =============================================================================

declare -A DOTFILES
DOTFILES[HOME_DIR]="${HOME}/.dotfiles"
DOTFILES[CONFIG]="${DOTFILES[HOME_DIR]}/configs"
DOTFILES[FUNCTIONS]="${DOTFILES[HOME_DIR]}/functions"
DOTFILES[AUTOLOADS]="${DOTFILES[HOME_DIR]}/autoloads"
DOTFILES[HOOKSCRIPTS]="${DOTFILES[HOME_DIR]}/hookscripts"
DOTFILES[ATINIT]="${DOTFILES[HOOKSCRIPTS]}/atini"
DOTFILES[ATPULL]="${DOTFILES[HOOKSCRIPTS]}/atpull"
DOTFILES[ATCLONE]="${DOTFILES[HOOKSCRIPTS]}/atclone"
DOTFILES[ATLOAD]="${DOTFILES[HOOKSCRIPTS]}/atload"

# =============================================================================
# ENV-VARS: Zshell Customization
# =============================================================================c

# CONFIG. CACHE, LOCAL
export LOCAL="${HOME}/.local" && mkdir -p "${LOCAL}"
export CONFIG="${LOCAL}/.config" && mkdir -p "${CONFIG}"
export CACHE="${LOCAL}/.cache" && mkdir -p "${CACHE}"
export LIB="${LOCAL}/lib" && mkdir -p "${LIB}"
export BIN="${LOCAL}/bin" && mkdir -p "${BIN}"

# Specify custom Zsh dotfilez directory
export ZDOTDIR="${DOTFILES[HOME_DIR]}/configs/zsh" && mkdir -p "${ZDOTDIR}"

# Specify help files directory
export HELPDIR="/opt/homebrew/share/zsh/help" && mkdir -p "${HELPDIR}"

# =============================================================================
# ENV VARS: XDG
# =============================================================================

# Config
export XDG_CONFIG_HOME="${DOTFILES[HOME_DIR]}/config"
export XDG_CONFIG_DIRS="${XDG_CONFIG_HOME}":"${CONFIG}":"${XDG_CONFIG_DIRS}"

# Data
export XDG_DATA_HOME="${SHARE}"
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS}

# Misc
export XDG_LIB_HOME="${LIB}" && mkdir -p "${XDG_LIB_HOME}"
export XDG_CACHE_HOME="${CACHE}" && mkdir -p "${XDG_CACHE_HOME}"
export XDG_STATE_HOME="${STATE}" && mkdir -p "${XDG_STATE_HOME}"
export XDG_RUNTIME_DIR="/tmp/zsh-${UID}"
# Bin"
export XDG_BIN_HOME="${BIN}"
export XDG_BIN_DIRS="${XDG_BIN_HOME}:${XDG_BIN_DIRS}}"

# =============================================================================
# ENV VARS: ZINIT Related
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

typeset POWERLEVEL9K_CONFIG_FILE="${XDG_CONFIG_HOME}/.p10k"
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

export PATH="\
/opt/homebrew/{bin,sbin}
${BIN}:/Users/${USER}/Library/Python/3.7/bin:/Users/${USER}/Library/Python/3.8/bin:/Users/${USER}/Library/Python/3.9/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH"

export PATH="/opt/homebrew/bin:$PATH"

# Set PKG_CONFIG_PATH
export PKG_CONFIG_PATH=(
  /opt/homebrew/lib/pkgconfig
  $PKG_CONFIG_PATH
)

AUTOLOADS="${DOTFILES[AUTOLOADS]}"
FPATH=("${AUTOLOADS}" "$FPATH")
autoload -Uz "${AUTOLOADS}/*(:t)"

fpath=${HOMEBREW_PREFIX}/share/zsh-completions:$fpath
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
