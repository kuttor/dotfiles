#!/usr/bin/env zsh

# Zplug install check
if ! "${ZPLUG_HOME}/init.zsh"
then
    git clone "https://github.com/b4b4r07/zplug" $ZPLUG_HOME
fi

# Initialize Zplug
source "$ZPLUG_HOME/init.zsh"

# Prompted plugin installer
if ! zplug check --verbose
then
    printf "Install zplug plugins? [y/N]: "
    if read -q
	then
        echo; zplug install
	fi
fi

# Extra settings
COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

# Self-management
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# History
zplug "zsh-users/zsh-history-substring-search"
#zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Navigation
zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "plugins/fasd", from:oh-my-zsh
zplug "rupa/z", use:z.sh

# Theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, defer:3, as:theme

# Git
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "supercrabtree/k"
zplug "peco/peco", from:gh-r

# Languages
zplug "plugins/jsontools", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh

# Internet of things
zplug "plugins/web-search", from:oh-my-zsh

# Bring on the color
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# SysOps
zplug "gko/ssh-connect"
zplug "skx/sysadmin-util"

# Completions
zplug "plugins/compleat", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "lib/completion", from:oh-my-zsh
zplug "EslamElHusseiny/aws_manager_plugin"
zplug "glidenote/hub-zsh-completion"
zplug 'Valodim/zsh-curl-completion'

# System
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "jamesob/desk", from:github, as:command, use:"desk"
zplug "plugins/composer", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "zuxfoucault/colored-man-pages_mod", from:oh-my-zsh
zplug 'b4b4r07/zplug-doctor', lazy:yes
zplug 'b4b4r07/zplug-cd', lazy:yes
zplug 'b4b4r07/zplug-rm', lazy:yes
zplug "stedolan/jq", \
    as:command, from:gh-r, rename-to:jq

zplug "junegunn/fzf-bin", \
    as:command, from:gh-r, rename-to:"fzf", frozen:1

# Uninstalled plugs check
zplug check --verbose || zplug install

# Load plugs
zplug load
