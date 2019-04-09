#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# name: Andrew Kuttor
# mail: andrew.kuttor@gmail.com

# Load Zplug
source $ZPLUG_HOME/init.zsh

zplug "hlissner/zsh-autopair"
zplug "knu/zsh-manydots-magic"
zplug "tysonwolker/iterm-tab-colors"
zplug "changyuheng/zsh-interactive-cd"

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/completion", from:oh-my-zsh
zplug "chrissicool/zsh-bash", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "github/hub", from:github
zplug "plugins/sudo", from:oh-my-zsh
zplug "jimeh/zsh-peco-history", defer:2, hook-build:'ZSH_PECO_HISTORY_DEDUP=1'
zplug "rupa/z", use:z.sh
zplug "skywind3000/z.lua"
zplug "aperezdc/zsh-fzy"
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "andrewferrier/fzf-z"
zplug "ytet5uy4/fzf-widgets", hook-load:'FZF_WIDGET_TMUX=1'

if zplug check "b4b4r07/zsh-history-enhanced"; then
    ZSH_HISTORY_FILE="$HISTFILE"
    ZSH_HISTORY_FILTER="fzf:peco:percol"
    ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
    ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
fi



# zsh users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# Check and install packages
if ! zplug check --verbose
then
    zplug install
fi

zplug load
