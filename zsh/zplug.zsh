#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------
# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

# Load Zplug
source $ZPLUG_HOME/init.zsh

# App Enhancing
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh

# Completion
zplug "plugins/completion", from:oh-my-zsh
zplug "zsh-users/zsh-completions", from:github

# Git
zplug "plugins/git-extras", from:oh-my-zsh

# Fuzzy
zplug "b4b4r07/enhancd", use:init.sh
zplug "rupa/z", use:z.sh
zplug "skywind3000/z.lua"
zplug "aperezdc/zsh-fzy"
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "andrewferrier/fzf-z", from:github

# Theme
zplug "agkozak/agkozak-zsh-prompt"

# Colors
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Terminal Magic
zplug "psprint/zsh-navigation-tools"
zplug "hlissner/zsh-autopair"
zplug "knu/zsh-manydots-magic"
zplug "zsh-users/zsh-autosuggestions", defer:2

# Check and install packages
if ! zplug check --verbose
then
  zplug install
fi

zplug load --verbose
