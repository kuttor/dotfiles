#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------
# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

# Essential
# -----------------------------------------------------------------------------
source $ZPLUG_HOME/init.zsh

# MISC
# -----------------------------------------------------------------------------
zplug "b4b4r07/enhancd", use:init.sh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "hlissner/zsh-autopair"
zplug "knu/zsh-manydots-magic"

# COMPLETION
# -----------------------------------------------------------------------------
zplug "plugins/completion", from:oh-my-zsh
zplug "zsh-users/zsh-completions", from:github

# GIT
# -----------------------------------------------------------------------------
zplug "plugins/git-extras", from:oh-my-zsh

# Fuzzy
# -----------------------------------------------------------------------------
zplug "rupa/z", use:z.sh
zplug "skywind3000/z.lua"
zplug "aperezdc/zsh-fzy"
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "andrewferrier/fzf-z", from:github

# Pure
# -----------------------------------------------------------------------------
zplug "mafredri/zsh-async", from:github, on:"sindresorhus/pure"
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme, \
      if:"[[ $TERM != 'dumb' ]]", \
      hook-load:"PURE_GIT_PULL=1"

# Zsh-Autosuggestions
# -----------------------------------------------------------------------------
zplug "zsh-users/zsh-autosuggestions", from:github

# COLORS
# -----------------------------------------------------------------------------
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Install packages that have not been installed yet
# -----------------------------------------------------------------------------
if ! zplug check --verbose; then
  zplug install
fi

zplug load --verbose
