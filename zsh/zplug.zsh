#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------
# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

# Essential
source $ZPLUG_HOME/init.zsh

# SELF MANAGE
# zplug "zplug/zplug", hook-build:"zplug --self-manage"

# PROMPT
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# # MISC
zplug "b4b4r07/enhancd", use:init.sh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "hlissner/zsh-autopair"
zplug "knu/zsh-manydots-magic"

# COMPLETION
zplug "plugins/completion", from:oh-my-zsh
zplug "zsh-users/zsh-completions", from:github

# GIT
zplug "plugins/git-extras", from:oh-my-zsh

# Fuzzy
zplug "rupa/z", use:z.sh
zplug "skywind3000/z.lua"
zplug "aperezdc/zsh-fzy"
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "andrewferrier/fzf-z", from:github

# theme
[[ $TERM == "dumb" ]] && PS1='$ '

# Pure
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme, \
      if:"[[ $TERM != 'dumb' ]]", \
      hook-load:"PURE_GIT_PULL=1"

# Zsh-Async
zplug "mafredri/zsh-async", from:github, on:"sindresorhus/pure"

# Zsh-Autosuggestions
zplug "zsh-users/zsh-autosuggestions", from:github

# COLORS
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Install packages that have not been installed yet
if ! zplug check --verbose; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
