#!/usr/bin/env n
# xdg based variables
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"

export DOTFILES="$HOME/.dotfiles"
export DOT_HOOKS_HOME="$DOTFILES/hooks"
export DOT_CONFIG_HOME="$DOTFILES/config"
export DOT_ZSH_HOME="$DOTFILES/config/zsh"
export DOT_FUNCTIONS_HOME="$DOTFILES/functions"

# zsh environment variables
export ZSH_CACHE="$XDG_CACHE_HOME/zsh" && mkdir -p "$XDG_CACHE_HOME/zsh"
export HELPDIR="/usr/share/zsh"
export HISTFILE="$ZSH_CACHE/history.zsh" 


export SHELL_SESSION_DIR="$ZSH_CACHE/zsh_sessions"
export SHELL_SESSION_FILE="$SHELL_SESSION_DIR/$TERM_SESSION_ID.session"
mkdir -m 700 -p "$SHELL_SESSION_DIR"

# history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

#export ZINIT_HOME="$HOMEBREW_PREFIX/opt/zinit/zinit.git"

# setup zinit env-vars
export ZINIT
typeset -A ZINIT=(
  HOME_DIR                   /opt/homebrew/opt/zinit
  BIN_DIR                    /opt/homebrew/opt/zinit/bin
  PLUGINS_DIR                /opt/homebrew/opt/zinit/plugins
  MODULES_DIR                /opt/homebrew/opt/zinit/modules
  SNIPPETS_DIR               /opt/homebrew/opt/zinit/snippets
  COMPLETIONS_DIR            /opt/homebrew/opt/zinit/completions
  ZCOMPDUMP_PATH             $XDG_CACHE_HOME/zsh/zcompdump
  OPTIMIZE_OUT_DISK_ACCESSES true
  COMPINIT_OPTS              " -C"
  LIST_COMMAND               "lsd --color=always --tree --icons -L3"
  LIST_SYMBOLS_DIR           "lsd --color=always --tree --icons=always --depth=3"
)

# core environment
export LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# private git config stored in .localrc
export GIT_AUTHOR_NAME="Andrew Kuttor"
export GIT_AUTHOR_EMAIL="andrew.kuttor@gmail.com"
export GIT_COMMITTER_NAME="Andrew Kuttor"
export GIT_COMMITTER_EMAIL="andrew.kuttor@gmail.com"
export GIT_CONFIG_GLOBAL="$HOME/.config/git/config"
export GIT_CONFIG_SYSTEM="$HOME/.config/git/config"
export GIT_CONFIG="$HOME/.config/git/config"

# -- autoload functions ---------------------------------------------------------------------------
setopt EXTENDED_GLOB
fpath=("$DOT_FUNCTIONS_HOME" "${fpath}")
autoload -Uz $DOT_FUNCTIONS_HOME/*(.:t)

# -- XDG based variables --------------------------------------------------------------------------
set_xdg "config" "NPM_CONFIG_USERCONFIG"    "create path" "npm/npmrc"
set_xdg "config" "RIPGREP_CONFIG_FILE"      "create path" "ripgrep/.ripgreprc"
set_xdg "config" "PIP_CONFIG_FILE"          "create path" "pip/pip.conf"
set_xdg "config" "BAT_CONFIG_PATH"          "create path" "bat/"
set_xdg "config" "FZF_CONFIG_PATH"          "create path" "fzf/"
set_xdg "config" "EDITORCONFIG_RC"          "create path" "editorconfig/editorconfigrc"
set_xdg "config" "SHELLSCRIPT_RC"           "create path" "shellscript/shellscriptrc"
set_xdg "config" "ZSH_TMUX_CONFIG"          "create path" "tmux/tmux.conf"
set_xdg "config" "DOCKER_CONFIG"            "create path" "docker/docker.conf"
set_xdg "config" "PYTHONSTARTUP"            "create path" "python/startup.py"
set_xdg "config" "GIT_CONFIG"               "create path" "git/config"
set_xdg "config" "RUSTUP_HOME"              "create path" "rust/rustup"
set_xdg "config" "CARGO_HOME"               "create path" "rust/cargo"
set_xdg "config" "CURL_HOME"                "create path" "curl/"
set_xdg "config" "VIMDOTDIR"                "create path" "vim/"
set_xdg "config" "LESSKEY"                  "create path" "less/lesskey"
set_xdg "config" "MYVIMRC"                  "create path" "nvim/nvim.confs"
set_xdg "config" "INPUTRC"                  "create path" "inputrc/inputrc"
set_xdg "config" "ZDOTDIR"                  "create path" "zsh/"
set_xdg "config" "WGETRC"                   "create path" "wget/wgetrc"
set_xdg "config" "RBENV_ROOT"               "create path" "rbenv/"
set_xdg "data"   "GOPATH"                   "create path" "go/"
set_xdg "data"   "ANTIDOT_DIR"              "create path" "antidot/"
set_xdg "data"   "NODE_PATH"                "create path" "node/"
set_xdg "data"   "GEM_HOME"                 "create path" "gem/"
set_xdg "cache"  "GEM_SPEC_CACHE"           "create path" "gem/"
set_xdg "config" "TERMINFO"                 "create path" "terminfo/"
set_xdg "data"   "TMUX_PLUGIN_MANAGER_PATH" "create path" "tmux/plugins"
set_xdg "cache"  "NODE_REPL_HISTORY"        "create path" "node_repl_history"
set_xdg "cache"  "LESSHISTFILE"             "create path" "less/history.less"
set_xdg "cache"  "ZSH_CACHE_DIR"            "create path" "zsh/"

# Terminal and environment
export TIMEFMT="%u user %s system %p cpu %*es total"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=yes
export TERM=xterm-256color ITERM_24BIT=1 KEYTIMEOUT=1 REPORTTIME=2

# Pagers, editors, and tools
export PAGER=less
export EDITOR=nvim
export VISUAL=$EDITOR
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
check nvim && alias vim=nvim

# antidot
[ -f "$XDG_DATA_HOME/antidot/env.sh" ] && . "$XDG_DATA_HOME/antidot/env.sh"
[ -f "$XDG_DATA_HOME/antidot/alias.sh" ] && . "$XDG_DATA_HOME/antidot/alias.sh"

# remove duplicate paths from the PATH, MANPATH, INFOPATH, and FPATH
typeset -Ugx PATH FPATH MANPATH INFOPATH path fpath manpath infopath

path=(
  $HOMEBREW_PREFIX/{bin,sbin}
  $CARGO_HOME/bin
  $ZPFX/bin
  /usr/local/bin
  /usr/{bin,sbin}
  $path
)

fpath=(
  $DOT_FUNCTIONS_HOME
  /usr/share/zsh/5.9/{functions,help,scripts}
  $HOMEBREW_PREFIX/share/zsh/site-functions
  $HOMEBREW_PREFIX/completions
  $fpath
)

manpath=(
  /usr/share/man
  /usr/share/zsh/5.9/help
  $HOMEBREW_PREFIX/manpages
  $HOMEBREW_PREFIX/share/man
  $manpath
)

infopath=(
  $infopath
)

# Source antidot files
source_if_exists "$ANTIDOT_DIR/{env,alias}.sh"
. "$XDG_CONFIG_HOME/rust/env"
. "$XDG_CONFIG_HOME/rust/cargo/env"
