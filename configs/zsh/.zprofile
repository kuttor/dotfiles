#!/usr/bin/env zsh

# random tldr
#command -v tldr &>/dev/null && tldr --quiet $(tldr --quiet --list | shuf -n1)

ulimit -c unlimited

export DOTFILES="$HOME/.dotfiles"

# skip the creation of global compinit
export skip_global_compinit=1
export __CF_USER_TEXT_ENCODING="0x1F5:0x0:0x0"

# deprecating zshenv in favor for zprofile
[[ -f /etc/zshenv && -f /etc/zprofile ]] && sudo mv /etc/zshenv /etc/zprofile

# -- dotfiles --
export DOTFILES="$HOME/.dotfiles"
export DOTS_CONFIGS_DIR="$DOTFILES/configs"
export DOTS_FUNCTIONS_DIR="$DOTFILES/functions"
export DOTS_HOOKS_DIR="$DOTFILES/hooks"

# -- xdg base --
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_DATA_DIRS="${XDG_DATA_HOME}:${XDG_DATA_DIRS}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_HOME}:${DOTS_CONFIGS_DIR}:${XDG_CONFIG_DIRS}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"
export XDG_BIN_DIRS="${XDG_BIN_HOME}:${XDG_BIN_DIRS}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# -- antidot --
[[ -f "${XDG_DATA_HOME}/antidot/env.sh" ]] && . "${XDG_DATA_HOME}/antidot/env.sh"
[[ -f "${XDG_DATA_HOME}/antidot/alias.sh" ]] && . "${XDG_DATA_HOME}/antidot/alias.sh"

# -- homebrew --
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
export HOMEBREW_NO_ENV_HINT=1
export HOMEBREW_NO_ANALYTICS=1

# -- zshell --
export ZDOTDIR="${HOME}/.dotfiles/configs/zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"
export ZSH_CONFIG_DIR="${ZDOTDIR}/rc"
export ZSH_DATA_DIR="/usr/share/zsh"
export HELPDIR="${ZSH_DATA_DIR}" && mkdir -p "${HELPDIR}"

# -- zinit  --
export ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git" && mkdir -p "${ZINIT_HOME}"
export ZPFX="${XDG_DATA_HOME}/zinit/polaris" && mkdir -p "${ZPFX}"

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

# -- history --
HISTFILE="${HISTFILE:-${XDG_CACHE_DIR}/.zsh_history}"
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# -- wget --
export WGETRC="${DOTFILES[CONFIGS]}/wgetrc"

# -- curl --
export CURL_HOME="${DOTFILES[CONFIGS]}/curl"

# -- gnupg --
export GNUPGHOME="${DOTFILES[CONFIGS]}/.gnuphg"

# -- inputrc --
export INPUTRC="${DOTFILES[CONFIGS]}/inputrc"

# -- doocker --
export DOCKER_CONFIG="${DOTFILES[CONFIGS]}/docker"

# -- exa --
export EXA_CONFIG_PATH="${DOTFILES[CONFIGS]}/exa.conf"

# -- shellscript --
export SHELLSCRIPT_RC="${DOTFILES[CONFIGS]}/shellscriptrc"

# -- ripgrep --
export RPGREP_CONFIG_PATH="${DOTFILES[CONFIGS]}/ripgreprc"

# -- editorconfig --
export EDITORCONFIGRC="${DOTFILES[CONFIGS]}/editorconfigrc"

# -- fuzzy --
export ZENO_HOME="${DOTFILES[CONFIGS]}/zeno"

# -- rust --
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

# -- bat --
export BAT_PAGER="less"
export BAT_CONFIG_PATH="${DOTFILES[CONFIGS]}/bat.conf"

# -- neovim --
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
#export LESSOPEN='| pygmentize -g %s'

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

# -- pagers --
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="less"

# --editors --
export EDITOR="nvim"
export VISUAL="$EDITOR"

# -- cmake --
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# -- git --
export GITSTATUS_LOG_LEVEL=DEBUG
export GITSTATUS_CACHE_DIR="${XDG_CACHE_HOME}/gitstatus"
export GITSTATUS_SHOW_UNTRACKED_FILES="all"
export GIT_CONFIG="${DOTFILES[CONFIGS]}/git/config"

# -- fzf --
export FZF_CONFIG_PATH="${DOTFILES[CONFIGS]}/fzf.conf"
