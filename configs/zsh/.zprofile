# vim:set filetype=zsh syntax=zs
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab nu clipboard+=unnamedplus foldmethsofttabstop=0
# Vim:set nu clipboard+=unnamedplus foldmethsofttabstop=0

export DOTFILES_TEST=$0:h

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
export XDG_CONFIG_DIRS="${XDG_CONFIG_HOME}":"${DOTFILES[CONFIGS]}":"${XDG_CONFIG_DIRS}"
export XDG_DATA_DIRS="${XDG_DATA_HOME}":"${XDG_DATA_DIRS}"
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
DOTFILES[HOOKS]="${DOTFILES[HOME]}/hooks"
DOTFILES[CONFIGS]="${DOTFILES[HOME]}/configs"
DOTFILES[ZSH]="${DOTFILES[HOME]}/configs/zsh"
DOTFILES[FUNCTIONS]="${DOTFILES[HOME]}/functions"

# -- Dotfiles Array Shorteners --
export FUNCTIONS="${DOTFILES[FUNCTIONS]}"
export CONFIGS="${DOTFILES[CONFIGS]}"
export HOOKS="${DOTFILES[HOOKS]}"

# -- History --
export HISTFILE="${XDG_CACHE_HOME}/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=10000
export SAVEHIST=10000

# -- Homebrew --
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
export HOMEBREW_NO_ENV_HINT=1
export HOMEBREW_NO_ANALYTICS=1

export PATH="${HOMEBREW_PREFIX}/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"

# -- ZShell Custom Vars--
export ZDOTDIR="${HOME}/.dotfiles/configs/zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"
export ZSH_CONFIG_DIR="${ZDOTDIR}/rc"
export ZSH_DATA_DIR="/usr/share/zsh"
export HELPDIR="${ZSH_DATA_HOME}"
mkdir -p "${HELPDIR}"

# Zinit Custom Vars
export ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
mkdir -p "${ZINIT_HOME}"
export ZPFX="${XDG_DATA_HOME}/zinit/polaris"
mkdir -p "${ZPFX}"

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

# -- config files --
export CURL_HOME="${DOTFILES[CONFIGS]}/curl"
export GNUPGHOME="${DOTFILES[CONFIGS]}/.gnuphg"
export WGETRC="${DOTFILES[CONFIGS]}/wgetrc"
export INPUTRC="${DOTFILES[CONFIGS]}/inputrc"
export DOCKER_CONFIG="${DOTFILES[CONFIGS]}/docker"
export EXA_CONFIG_PATH="${DOTFILES[CONFIGS]}/exa.conf"
export EZA_CONFIG_PATH="${DOTFILES[CONFIGS]}/eza.conf"
export FZF_CONFIG_PATH="${DOTFILES[CONFIGS]}/fzf.conf"
export SHELLSCRIPT_RC="${DOTFILES[CONFIGS]}/shellscriptrc"
export RPGREP_CONFIG_PATH="${DOTFILES[CONFIGS]}/ripgreprc"
export EDITORCONFIGRC="${DOTFILES[CONFIGS]}/editorconfigrc"
export POWERLEVEL10K_CONFIG_FILE="${DOTFILES[CONFIGS]}/.p10k.zsh"

# -- rust --
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
# -- bat --
export BAT_PAGER="less"
export BAT_CONFIG_PATH="${DOTFILES[CONFIGS]}/bat.conf"

# -- neovim --
#export VIMINIT="${LOCAL_CONFIG}/nvim"
export MYVIMRC="${XDG_CONFIG_HOME}/nvim"
export VIMDOTDIR="${XDG_CONFIG_HOME}/vim"

# -- ruby --
export GEM_HOME="${XDG_DATA_HOME}/gem"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"

# -- tmux --
export TMUX_TEMPDIR="${XDG_CACHE_HOME}/tmux"
export ZSH_TMUX_CONFIG="${DOTFILES[CONFIGS]}/tmux.conf"
export TMUX_PLUGIN_MANAGER_PATH="${XDG_DATA_HOME}/tmux/plugins"

# -- javascript --
export NODE_PATH="${XDG_DATA_HOME}/node"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"

# -- less --
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
export LESSKEY="${DOTFILES[CONFIGS]}/less/lesskey"
export LESSOPEN='| pygmentize -g %s'

# -- pip --
export PIP_LOG_FILE="${XDG_CACHE_HOME}/pip/pip.log"
export PIP_CONFIG_FILE="${DOTFILES[CONFIGS]}/pip/pip.conf"

# -- terminal --
export TIMEFMT="%U user %S system %P cpu %*Es total"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"
export ITERM_24BIT="1"
export KEYTIMEOUT="1"
export REPORTTIME="2"
export TERM="xterm-256color"
export TERMINFO="${XDG_DATA_HOME}/terminfo"
export TERMINFO_DIRS="${XDG_DATA_HOME}/terminfo:/usr/share/terminfo"

# -- editors and pagers --
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="less"
export VISUAL="$EDITOR"

# -- python --
export PYTHONDONTWRITEBYTECODE=true
#export PYTHONSTARTUP="${DOTFILES[CONFIGS]}/python/.python_startup.py" && mkdir -p "${DOTFILES[CONFIGS]}/python"

# -- cmake --
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# -- git --
export GITSTATUS_LOG_LEVEL=DEBUG
export GITSTATUS_CACHE_DIR="${XDG_CACHE_HOME}/gitstatus"
export GITSTATUS_SHOW_UNTRACKED_FILES="all"
export GIT_CONFIG="${DOTFILES[CONFIGS]}/git/config"
