#!/usr/local/bin/zsh
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com

# -----------------------------------------------------------------------------
# Plugins
# -----------------------------------------------------------------------------

# Initialize ZPlug
export zplug_home="$HOME/.zplug"
source $(brew --prefix zplug)/init.zsh

# Self Manage
zplug 'zplug/zplug', hook-build:"zplug --self-manage"

# Prompt
zplug "mafredri/zsh-async", from:"github"
zplug "sindresorhus/pure", use:pure.zsh, from:"github", as:theme

# Git
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"

# Z/FZF
zplug "skywind3000/z.lua", from:"github", use:"z.lua"
zplug "changyuheng/fz", from:"github", defer:"1"
zplug "andrewferrier/fzf-z", from:"github"

# ZAW/CDR
zplug "zsh-users/zaw", from:"github"
zplug "willghatch/zsh-cdr", from:"github"

# Percol
zplug "mooz/percol", from:"github"

# Readline improvements
zplug "b4b4r07/enhancd", use:init.sh
zplug "hlissner/zsh-autopair", from:"github", as:"plugin"
zplug "knu/zsh-manydots-magic", from:"github" 
zplug "kutsan/zsh-system-clipboard", from:"github"
zplug "zsh-users/zsh-autosuggestions", from:"github", defer:2
zplug "zsh-users/zsh-completions", from:"github"
o


zplug "plugins/urltools"
zplug "tomplex/jenkins-zsh"




# History
zplug "b4b4r07/zsh-history-enhanced", from:"github"
zplug "zsh-users/zsh-history-substring-search", from:"github", defer:3

# Colors
zplug 'zdharma/fast-syntax-highlighting', hook-load:'FAST_HIGHLIGHT=()'

# Check and Install for added plugins
zplug check || zplug install

# Load ZPlug plugins
zplug load
