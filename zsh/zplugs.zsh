#!/usr/bin/env zsh

# Zplug install check
if ! ${ZDOTDIR}/zplug/init.zsh
then
    git clone "https://github.com/b4b4r07/zplug" "$ZDOTDIR/zplug"
fi

# Initialize Zplug
source "$ZDOTDIR/zplug/init.zsh"

# Actually install plugins, prompt user input
if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
	fi
fi

# Plug to allow Zplug self-management
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# Plugs for directory and history navigation
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "plugins/fasd", from:oh-my-zsh
zplug "rupa/z", use:z.sh

# Plugs for Pure theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, defer:3, as:theme

# Plugs for Git
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "supercrabtree/k"
zplug "peco/peco", from:gh-r

# Plugs for languages
zplug "plugins/jsontools", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh

# Internet of things
zplug "plugins/web-search", from:oh-my-zsh

# Bring on the color
zplug "Tarrasch/zsh-colors"
zplug "chrissicool/zsh-256color"
zplug "joel-porquet/zsh-dircolors-solarized"

# DevOps plugs
zplug "gko/ssh-connect"
zplug "skx/sysadmin-util"

# Completions plugs
zplug "plugins/compleat", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "lib/completion", from:oh-my-zsh
zplug "EslamElHusseiny/aws_manager_plugin"

# System plugs
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "jamesob/desk", from:github, as:command, of:"desk"
zplug "plugins/composer", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh

# Uninstalled plugs check
zplug check --verbose || zplug install

# Load plugs
zplug load --verbose

# Add hotkeys to history search
if zplug check "zsh-users/zsh-history-substring-search"
then
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
fi

# Dircolor checker
if zplug check joel-porquet/zsh-dircolors-solarized
then
    setupsolarized dircolors.256dark
fi
