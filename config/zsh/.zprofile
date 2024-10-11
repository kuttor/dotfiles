#!/usr/bin/env zsh

ulimit -c unlimited

# Core environment
export LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# Set individual paths correctly
export DOTFILES="$HOME/.dotfiles"
export DOT_HOOKS_HOME="$DOTFILES/hooks"
export DOT_ZSH_HOME="$DOTFILES/config/zsh"
export DOT_CONFIGS_HOME="$DOTFILES/config"
export DOT_FUNCTIONS_HOME="$DOTFILES/functions"

fpath=($DOT_FUNCTIONS_HOME fpath)

setopt EXTENDED_GLOB
[[ -d "$DOT_FUNCTIONS_HOME" ]] && autoload -Uz "$DOT_FUNCTIONS_HOME"/*(.:t)

# Load custom functions
if [[ -d "$DOT_FUNCTIONS_HOME" ]]; then
    for FUNCTION in "$DOT_FUNCTIONS_HOME"/*(.N); do
        autoload -Uz "$FUNCTION"
    done
fi

# Example usage
set_xdg "config" "BAT_CONFIG_PATH" "bat.conf"
set_xdg "config" "CARGO_HOME" "rust"
set_xdg "config" "CURL_HOME" "curl"
set_xdg "config" "DOCKER_CONFIG" "docker"
set_xdg "config" "EDITORCONFIG_RC" "editorconfigrc"
set_xdg "config" "EXA_CONFIG_PATH" "exa.conf"
set_xdg "config" "FZF_CONFIG_PATH" "fzf.conf"
set_xdg "config" "GIT_CONFIG" "git/config"
set_xdg "config" "GNUPGHOME" "gnupg"
set_xdg "config" "INPUTRC" "inputrc"
set_xdg "config" "LESSKEY" "less/lesskey"
set_xdg "config" "MYVIMRC" "nvim/nvim.confs"
set_xdg "config" "NPM_CONFIG_USERCONFIG" "npm/npmrc"
set_xdg "config" "PIP_CONFIG_FILE" "pip/pip.conf"
set_xdg "config" "PYTHONSTARTUP" "python/startup.py"
set_xdg "config" "RIPGREP_CONFIG_PATH" "ripgrep/ripgreprc"
set_xdg "config" "RUSTUP_HOME" "rustup/"
set_xdg "config" "SHELLSCRIPT_RC" "shellscriptrc"
set_xdg "config" "VIMDOTDIR" "vim/"
set_xdg "config" "WGETRC" "wget/wgetrc"
set_xdg "config" "ZDOTDIR" "zsh/"
set_xdg "config" "ZENO_HOME" "zeno/"
set_xdg "config" "ZSH_TMUX_CONFIG" "tmux/tmux.conf"
set_xdg "data" "ANTIDOT_DIR" "antidot"
set_xdg "data" "GEM_HOME" "gem"
set_xdg "data" "NODE_PATH" "node"
set_xdg "data" "TERMINFO" "terminfo"
set_xdg "data" "TMUX_PLUGIN_MANAGER_PATH" "tmux/plugins"
set_xdg "data" "ZINIT_HOME" "zinit/zinit.git"
set_xdg "data" "ZPFX" "zinit/polaris"
set_xdg "cache" "HISTFILE" "zsh/.zsh_history"
set_xdg "cache" "LESSHISTFILE" "less/history"
set_xdg "cache" "NODE_REPL_HISTORY" "node_repl_history"
set_xdg "cache" "ZSH_CACHE_DIR" "zsh"

# history
export HISTSIZE=10000 SAVEHIST=$HISTSIZE

# Zsh
export HELPDIR="/usr/share/zsh"
# mkdir -p "$HELPDIR"

# Terminal and environment
export TIMEFMT="%u user %s system %p cpu %*es total"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=yes TERM=xterm-256color ITERM_24BIT=1 KEYTIMEOUT=1 REPORTTIME=2

# Pagers, editors, and tools
export MANPAGER="sh -c 'col -bx | bat -l man -p'" PAGER=less EDITOR=nvim VISUAL=$EDITOR BAT_PAGER=less
export LDFLAGS="-L/usr/local/opt/ruby/lib" CPPFLAGS="-I/usr/local/opt/ruby/include"


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
    $HOME/.dotfiles/functions
    /usr/share/zsh/5.9/functions
    $XDG_DATA_HOME/zinit/plugins/brew/share/zsh/site-functions
    $HOMEBREW_PREFIX/share/zsh/site-functions
    $HOMEBREW_PREFIX/share/zsh/vendor-completions
    $HOMEBREW_PREFIX/share/zsh/completions
    $HOMEBREW_PREFIX/share/zsh/man/man1
    $fpath
)

manpath=(
    /usr/share/man(/N)
    $HOME/.local/share/zinit/plugins/brew/manpages(/N)
    $manpath
)

infopath=(
    $HOMEBREW_PREFIX/share/info
    $infopath
)

# Source antidot files
source_if_exists "$ANTIDOT_DIR/{env,alias}.sh"
