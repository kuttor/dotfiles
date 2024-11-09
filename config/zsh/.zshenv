#!/usr/bin/env zsh

# -- xdg based variables --
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"

export DOTFILES="$HOME/.dotfiles"
export DOT_HOOKS_HOME="$DOTFILES/hooks"
export DOT_CONFIG_HOME="$DOTFILES/config"
export DOT_ZSH_HOME="$DOTFILES/config/zsh"
export DOT_FUNCTIONS_HOME="$DOTFILES/functions"

# -- zsh env-vars --
export ZDOTDIR="$HOME/.dotfiles/config/zsh"
export ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"

# setup zinit env-vars
export ZINIT
typeset -A ZINIT
ZINIT[HOME_DIR]="${XDG_DATA_HOME}/zinit"
ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/zcompdump-$ZSH_VERSION"
ZINIT[LIST_COMMAND]="ls"
ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]="1"
ZINIT[COMPINIT_OPTS]=" -C"

# core environment
export LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# private git config stored in .localrc 
export GIT_AUTHOR_NAME="$LOCAL_GIT_AUTHOR_NAME"
export GIT_AUTHOR_EMAIL="$LOCAL_GIT_AUTHOR_EMAIL"
#export GIT_COMMITTER_NAME="Your Name"
#export GIT_COMMITTER_EMAIL="your@email.com"
# =================================================================================================
# -- autoload functions ---------------------------------------------------------------------------
# =================================================================================================
setopt EXTENDED_GLOB
fpath=("$DOT_FUNCTIONS_HOME" "${fpath}")
autoload -Uz $DOT_FUNCTIONS_HOME/*(.:t)

# =================================================================================================
# -- XDG based variables --------------------------------------------------------------------------
# =================================================================================================
set_xdg "config" "NPM_CONFIG_USERCONFIG"    "npm/npmrc"
set_xdg "config" "RIPGREP_CONFIG_PATH"      "ripgrep.conf"
set_xdg "config" "PIP_CONFIG_FILE"          "pip.conf"
set_xdg "config" "BAT_CONFIG_PATH"          "bat.conf"
set_xdg "config" "EXA_CONFIG_PATH"          "exa.conf"
set_xdg "config" "FZF_CONFIG_PATH"          "fzf.conf"
set_xdg "config" "EDITORCONFIG_RC"          "editorconfigrc"
set_xdg "config" "SHELLSCRIPT_RC"           "shellscriptrc"
set_xdg "config" "ZSH_TMUX_CONFIG"          "tmux.conf"
set_xdg "config" "DOCKER_CONFIG"            "docker.conf"
set_xdg "config" "PYTHONSTARTUP"            "python/startup.py"
set_xdg "config" "GIT_CONFIG"               "git/config"
set_xdg "config" "RUSTUP_HOME"              "rustup"
set_xdg "config" "CARGO_HOME"               "rust"
set_xdg "config" "ZENO_HOME"                "zeno/"
set_xdg "config" "CURL_HOME"                "curl"
set_xdg "config" "VIMDOTDIR"                "vim/"
set_xdg "config" "GNUPGHOME"                "gnupg"
set_xdg "config" "LESSKEY"                  "less/lesskey"
set_xdg "config" "MYVIMRC"                  "nvim/nvim.confs"
set_xdg "config" "INPUTRC"                  "inputrc"
set_xdg "config" "WGETRC"                   "wget/wgetrc"
set_xdg "data"   "ANTIDOT_DIR"              "antidot"
set_xdg "data"   "NODE_PATH"                "node"
set_xdg "data"   "GEM_HOME"                 "gem"
set_xdg "data"   "TERMINFO"                 "terminfo"
set_xdg "data"   "TMUX_PLUGIN_MANAGER_PATH" "tmux/plugins"
set_xdg "cache"  "NODE_REPL_HISTORY"        "node_repl_history"
set_xdg "cache"  "HISTFILE"                 "zsh.history"
set_xdg "cache"  "LESSHISTFILE"             "less.history"
set_xdg "cache"  "ZSH_CACHE_DIR"            "zsh"

# history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

# Zsh
export HELPDIR="/usr/share/zsh"
# mkdir -p "$HELPDIR"

# Terminal and environment
export TIMEFMT="%u user %s system %p cpu %*es total"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=yes
export TERM=xterm-256color ITERM_24BIT=1 KEYTIMEOUT=1 REPORTTIME=2

# Pagers, editors, and tools
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER=less
export EDITOR=nvim
export VISUAL=$EDITOR
export BAT_PAGER=less
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# remove duplicate paths from the PATH, MANPATH, INFOPATH, and FPATH
typeset -Ugx FPATH fpath path PATH MANPATH manpath INFOPATH infopath

path=(
  $ZPFX/bin
  /{sbin,bin}
  /usr/{sbin,bin}
  $HOME/.local/bin
  /usr/local/bin
  $HOME/bin
  $HOMEBREW_PREFIX/{sbin,bin}
  $path
)

fpath=(
   $DOT_FUNCTIONS_HOME
   /usr/share/zsh/5.9/functions
   ${ZINIT[PLUGINS_DIR]}/brew/share/zsh/site-functions
   $HOMEBREW_PREFIX/share/zsh/site-functions
   $HOMEBREW_PREFIX/share/zsh/vendor-completions
   $HOMEBREW_PREFIX/share/zsh/completions
   $HOMEBREW_PREFIX/share/zsh/man/man1
   $fpath
)

manpath=(
  /usr/share/man(/N)
  ${ZINIT[PLUGINS_DIR]}/brew/manpages(/N)
  $manpath
)

infopath=(
   $HOMEBREW_PREFIX/share/info
   $infopath
)

# Source antidot files
source_if_exists "$ANTIDOT_DIR/{env,alias}.sh"