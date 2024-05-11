# vim:set filetype=zsh syntax=zs
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab nu clipboard+=unnamedplus foldmethsofttabstop=0
# Vim:set nu clipboard+=unnamedplus foldmethsofttabstop=0

# Skip the creation of global compinit
export skip_global_compinit=1

# Deprecating zshenv in favor for zprofile
[[ -f /etc/zshenv && -f /etc/zprofile ]] && sudo mv /etc/zshenv /etc/zprofile

# XDG Base Directory
export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_BIN_HOME="$HOME/.local/bin"

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

# -- Dotfiles Array --
typeset -A DOTFILES
DOTFILES[HOME]="${HOME}/.dotfiles"
DOTFILES[HOOKS]="$DOTFILES[HOME]/hooks"
DOTFILES[CONFIGS]="$DOTFILES[HOME]/configs"
DOTFILES[ZSH]="$DOTFILES[HOME]/configs/zsh"
DOTFILES[FUNCTIONS]="$DOTFILES[HOME]/functions"

# -- Dotfiles Array Shorteners --
export FUNCTIONS="${DOTFILES[FUNCTIONS]}"
export CONFIGS="${DOTFILES[CONFIGS]}"
export HOOKS="${DOTFILES[HOOKS]}"

# -- History --
export HISTFILE="${LOCAL_CACHE}/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=10000
export SAVEHIST=10000

# -- Homebrew --
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
export HOMEBREW_NO_ENV_HINT=1
export HOMEBREW_NO_ANALYTICS=1

# -- ZShell Custom Vars--
export ZDOTDIR="${CONFIGS}/zsh"
export ZDATADIR="/usr/share/zsh"
export HELPDIR="${ZDATADIR}"
mkdir -p "${HELPDIR}"

# Zinit Custom Vars
export ZINIT_HOME="${LOCAL_DATA}/zinit/zinit.git"
mkdir -p "${ZINIT_HOME}"
export ZPFX="${LOCAL_DATA}/zinit/polaris"
mkdir -p "${ZPFX}"

# Neovim
export VIMINITx="${LOCAL_CONFIG}/nvim"
mkdir -p ${VIMINIT}
export MYVIMRC="${LOCAL_CONFIG}/nvim"
mkdir -p ${MYVIMRC}
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"

# Zinit Builtins Vars
typeset -A ZINIT
ZINIT[ZCOMPDUMP_PATH]="${HOME}/.local/cache/zsh/zcompdump"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]="1"
ZINIT[COMPINIT_OPTS]=" -C"
ZINIT[BIN_DIR]="${HOME}/.local/bin"
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
export GNUPGHOME="${LOCAL_CONFIGS}/.gnuphg"
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
export SHELLSCRIPT_RC="${CONFIGS}/shellscriptrc"
export PIP_CONFIG_FILE="${CONFIGS}/pip/pip.conf"
export RPGREP_CONFIG_PATH="${CONFIGS}/ripgreprc"
export EDITORCONFIGRC="${CONFIGS}/editorconfigrc"
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
#export PYTHONSTARTUP="${CONFIGS}/python/.python_startup.py" && mkdir -p "${CONFIGS}/python"

# Ruby
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# GIT
GITSTATUS_LOG_LEVEL=DEBUG
GITSTATUS_SHOW_UNTRACKED_FILES="all"
