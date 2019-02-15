#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------
# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

# Load Zplug
source $ZPLUG_HOME/init.zsh

# Theme
zplug "agkozak/agkozak-zsh-prompt"

# Misc
zplug "hlissner/zsh-autopair"
zplug "knu/zsh-manydots-magic"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/completion", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "github/hub", from:github
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "zsh-users/zsh-completions", from:github

# Fuzzy
zplug "b4b4r07/enhancd", use:init.sh
zplug "rupa/z", use:z.sh
zplug "skywind3000/z.lua"
zplug "aperezdc/zsh-fzy"
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "andrewferrier/fzf-z", from:github

# Magic
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Check and install packages
if ! zplug check --verbose
then
  zplug install
fi

zplug load --verbose
