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
typeset -A ZINIT=(
  HOME_DIR                   $XDG_DATA_HOME/zinit
  BIN_DIR                    $XDG_DATA_HOME/zinit/bin
  PLUGINS_DIR                $XDG_DATA_HOME/zinit/plugins
  MODULES_DIR                $XDG_DATA_HOME/zinit/modules
  SNIPPETS_DIR               $XDG_DATA_HOME/zinit/snippets
  COMPLETIONS_DIR            $XDG_DATA_HOME/zinit/completions
  ZCOMPDUMP_PATH             $XDG_CACHE_HOME/zcompdump-${HOST/.*/}-$ZSH_VERSION
  OPTIMIZE_OUT_DISK_ACCESSES "1"
  COMPINIT_OPTS              " -C"
  LIST_COMMAND               "exa --color=always --tree --icons -L3"
)

# core environment
export LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# private git config stored in .localrc 
export GIT_AUTHOR_NAME="Andrew Kuttor"
export GIT_AUTHOR_EMAIL="andrew.kuttor@gmail.com"
export GIT_COMMITTER_NAME="Andrew Kuttor"
export GIT_COMMITTER_EMAIL="andrew.kuttor@gmail.com"

# -- autoload functions ---------------------------------------------------------------------------
setopt EXTENDED_GLOB
fpath=("$DOT_FUNCTIONS_HOME" "${fpath}")
autoload -Uz $DOT_FUNCTIONS_HOME/*(.:t)

# -- XDG based variables --------------------------------------------------------------------------
set_xdg "config" "NPM_CONFIG_USERCONFIG"                  "npm/npmrc"
set_xdg "config" "PIP_CONFIG_FILE"                        "pip/pip.conf"
set_xdg "config" "BAT_CONFIG_PATH"                        "bat/bat.conf"
set_xdg "config" "FZF_CONFIG_PATH"                        "fzf/fzf.conf"
set_xdg "config" "EDITORCONFIG_RC"                        "editorconfig/editorconfigrc"
set_xdg "config" "SHELLSCRIPT_RC"                         "shellscript/shellscriptrc"
set_xdg "config" "ZSH_TMUX_CONFIG"                        "tmux/tmux.conf"
set_xdg "config" "DOCKER_CONFIG"                          "docker/docker.conf"
set_xdg "config" "PYTHONSTARTUP"                          "python/startup.py"
set_xdg "config" "GIT_CONFIG"                             "git/config"
set_xdg "config" "RUSTUP_HOME"              "create path" "rust/rustup"
set_xdg "config" "CARGO_HOME"               "create path" "rust/cargo"
set_xdg "config" "CURL_HOME"                "create path" "curl/"
set_xdg "config" "VIMDOTDIR"                "create path" "vim/"
set_xdg "config" "LESSKEY"                                "less/lesskey"
set_xdg "config" "MYVIMRC"                                "nvim/nvim.confs"
set_xdg "config" "INPUTRC"                                "inputrc/inputrc"
set_xdg "config" "WGETRC"                                 "wget/wgetrc"
set_xdg "config" "RBENV_ROOT"               "create path" "rbenv/"
set_xdg "data"   "ANTIDOT_DIR"              "create path" "antidot/"
set_xdg "data"   "NODE_PATH"                "create path" "node/"
set_xdg "data"   "GEM_HOME"                 "create path" "gem/"
set_xdg "cache"  "GEM_SPEC_CACHE"           "create path" "gem/"
set_xdg "config" "TERMINFO"                 "create path" "terminfo/"
set_xdg "data"   "TMUX_PLUGIN_MANAGER_PATH"               "tmux/plugins"
set_xdg "cache"  "NODE_REPL_HISTORY"                      "node_repl_history"
set_xdg "cache"  "HISTFILE"                               "zsh/history.zsh"
set_xdg "cache"  "LESSHISTFILE"                           "less/history.less"
set_xdg "cache"  "ZSH_CACHE_DIR"            "create path" "zsh/"
# histzsh
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

# Zsh
export HELPDIR="/usr/share/zsh"

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
  /{sbin,bin}
  /usr/local/bin
  /usr/{sbin,bin}
  $CARGO_HOME/bin
  $path
)

fpath=(
  $DOT_FUNCTIONS_HOME
  /usr/share/zsh/5.9/functions
  $fpath
)

manpath=(
  /usr/share/man
  $manpath
)

infopath=(
   $infopath
)

# Source antidot files
source_if_exists "$ANTIDOT_DIR/{env,alias}.sh"
. "/Users/akuttor/.config/rust//env"
