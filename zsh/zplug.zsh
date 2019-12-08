#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# name: Andrew Kuttor
# mail: andrew.kuttor@gmail.com

# Load Zplug
source "$HOME/.zplug/init.zsh"

# Let Zplug manage itself
#zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Purity Theme
zplug "mafredri/zsh-async"
zplug "joshjon/bliss-zsh", use:bliss.zsh-theme, from:github, as:theme

# git
zplug "github/hub"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "rapgenic/zsh-git-complete-urls"
zplug "unixorn/git-extra-commands"

# fzf/z
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "andrewferrier/fzf-z"
zplug "aperezdc/zsh-fzy"
zplug "ytet5uy4/fzf-widgets", hook-load:'FZF_WIDGET_TMUX=1'
zplug "rupa/z", use:z.sh

# completions
#zplug "plugins/completion", from:oh-my-zsh
zplug "zsh-users/zsh-completions"

# readline
zplug "zpm-zsh/ssh"
zplug "lib/clipboard", from:oh-my-zsh
zplug "chrissicool/zsh-bash", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "knu/zsh-manydots-magic", from:github
zplug "zsh-users/zsh-autosuggestions", from:github

# colors
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "zpm-zsh/colors"
zplug "zsh-users/zsh-syntax-highlighting", from:github

# history
zplug "zsh-users/zsh-history-substring-search", from:github

# -----------------------------------------------------------------------------

# History Substring Search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=9'

# Autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=1

# fzf
FZF_DEFAULT_OPTS="
     --extended-exact
     --cycle
     --reverse"

FZF_DEFAULT_OPTS+="
    --bind pgup:preview-up
    --bind pgdn:preview-down
    --bind ctrl-f:jump
    --bind ctrl-k:kill-line
    --bind ctrl-p:toggle-preview
    --bind ctrl-a:select-all"

FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

zplug check --verbose || zplug install
zplug load

