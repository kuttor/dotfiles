#!/usr/bin/env zsh

ulimit -c unlimited

# Core environment
export LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
#export DOTFILES="${${(%):-%x}:a:h:h}"
export DOTFILES="$HOME/.dotfiles"
#export "DOT_{HOOKS,CONFIGS,FUNCTIONS,ZSH}_HOME"="$DOTFILES"/{hooks,config,functions,config/zsh}(N)

# Set individual paths correctly
export DOT_HOOKS_HOME="$DOTFILES/hooks"
export DOT_CONFIGS_HOME="$DOTFILES/config"
export DOT_FUNCTIONS_HOME="$DOTFILES/functions"
export DOT_ZSH_HOME="$DOTFILES/config/zsh"

# Add function directories to fpath
fpath=($DOT_FUNCTIONS_HOME $fpath)

# Autoload all functions
if [[ -d "$DOT_FUNCTIONS_HOME" ]]; then
    autoload -Uz $DOT_FUNCTIONS_HOME/*(.:t)
fi

# Set utilities config paths
set_xdg config BAT_CONFIG_PATH bat.conf
set_xdg config CARGO_HOME rust
set_xdg config CURL_HOME curl
set_xdg config DOCKER_CONFIG docker
set_xdg config EDITORCONFIG_RC editorconfigrc
set_xdg config EXA_CONFIG_PATH exa.conf
set_xdg config FZF_CONFIG_PATH fzf.conf
set_xdg config GIT_CONFIG git/config
set_xdg config GNUPGHOME gnupg
set_xdg config GOPATH go
set_xdg config GRADLE_USER_HOME gradle
set_xdg config INPUTRC inputrc
set_xdg config IPYTHONDIR ipython
set_xdg config JUPYTER_CONFIG_DIR jupyter
set_xdg config LESSKEY less/lesskey
set_xdg config MYVIMRC nvim
set_xdg config NPM_CONFIG_USERCONFIG npm/npmrc
set_xdg config PIP_CONFIG_FILE pip/pip.conf
set_xdg config PYTHONSTARTUP python/startup.py
set_xdg config RIPGREP_CONFIG_PATH ripgrep/config
set_xdg config RUSTUP_HOME rustup
set_xdg config SHELLSCRIPT_RC shellscriptrc
set_xdg config VIMDOTDIR vim
set_xdg config WGETRC wget/wgetrc
set_xdg config ZDOTDIR zsh
set_xdg config ZENO_HOME zeno
set_xdg config ZSH_CONFIG_DIR zsh
set_xdg config ZSH_TMUX_CONFIG tmux.conf

# set utilities data paths
set_xdg data ANTIDOT_DIR antidot
set_xdg data GEM_HOME gem
set_xdg data NODE_PATH node
set_xdg data TERMINFO terminfo
set_xdg data TERMINFO_DIRS terminfo:/usr/share/terminfo
set_xdg data TMUX_PLUGIN_MANAGER_PATH tmux/plugins
set_xdg data ZINIT_HOME zinit/zinit.git
set_xdg data ZPFX zinit/polaris

# set utilities cache paths
set_xdg cache HISTFILE zsh/.zsh_history
set_xdg cache LESSHISTFILE less/history
set_xdg cache NODE_REPL_HISTORY node_repl_history
set_xdg cache ZSH_CACHE_DIR zsh

# history
export HISTSIZE=10000 SAVEHIST=$HISTSIZE

# Homebrew
export HOMEBREW_{PREFIX,CELLAR,REPOSITORY}="/opt/homebrew"
export HOMEBREW_NO_{ENV_HINT,ANALYTICS}=1

# Zsh
export ZSH_DATA_DIR="/usr/share/zsh"
export HELPDIR="$ZSH_DATA_DIR" && mkdir -p "$HELPDIR"

# Zinit
typeset -A ZINIT=(
    [MUTE_WARNINGS]=1 [COMPINIT_OPTS]="-c"
    [MAN_DIR]="$ZPFX/man" [BIN_DIR]="$ZPFX/bin"
    [OPTIMIZE_OUT_DISK_ACCESSES]=1
    [HOME_DIR]="$XDG_DATA_HOME/zinit"
    [PLUGIN_DIR]="$XDG_DATA_HOME/zinit/plugins"
    [SNIPPETS_DIR]="$XDG_DATA_HOME/zinit/snippets"
    [ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/zsh/zcompdump"
    [COMPLETIONS_DIR]="$XDG_DATA_HOME/zinit/completions"
)

# Terminal and environment
export TIMEFMT="%u user %s system %p cpu %*es total"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=yes TERM=xterm-256color ITERM_24BIT=1 KEYTIMEOUT=1 REPORTTIME=2

# Pagers, editors, and tools
export MANPAGER="sh -c 'col -bx | bat -l man -p'" PAGER=less EDITOR=nvim VISUAL=$EDITOR BAT_PAGER=less
export LDFLAGS="-L/usr/local/opt/ruby/lib" CPPFLAGS="-I/usr/local/opt/ruby/include"
export GITSTATUS_{LOG_LEVEL,SHOW_UNTRACKED_FILES}="debug all"

# Paths
typeset -U path fpath manpath infopath

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
    $HOME/.local/share/zsh/site-functions
    /usr/local/share/zsh/5.8/site-functions
    $ZSH_DATA_DIR/{site-functions,functions}
    $HOMEBREW_PREFIX/opt/zsh-completions/share/zsh-completions
    $HOMEBREW_PREFIX/{sbin,bin}
    $HOMEBREW_PREFIX/completions/zsh
    $HOMEBREW_PREFIX/share/zsh-completions
    $fpath
)

manpath=(
    $HOMEBREW_PREFIX/share/man
    $manpath
)

infopath=(
    $HOMEBREW_PREFIX/share/info
    $infopath
)

# Source antidot files
source_if_exists $ANTIDOT_DIR/{env,alias}.sh

set_xdg() {
    local type=$1 var=$2 path=$3
    case ${(L)type} in
        xdgconfig|config) type="CONFIG" ;;
        xdgdata|data) type="DATA" ;;
        xdgcache|cache) type="CACHE" ;;
        *) echo "Unknown XDG type: $1" >&2
        return 1 ;;
    esac

    local xdg_var="XDG_${type}_HOME"
    local xdg_home

    if [[ -n "${(P)xdg_var}" ]]; then
        xdg_home="${(P)xdg_var}"
    else
        case $type in
            CONFIG) xdg_home="$HOME/.config" ;;
            DATA)   xdg_home="$HOME/.local/share" ;;
            CACHE)  xdg_home="$HOME/.cache" ;;
        esac
    fi

    local full_path="$xdg_home/$path"
    export $var="$full_path"
}