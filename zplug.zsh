#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------o
# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

# Self Manage
zplug 'zplug/zplug', hook-build:"zplug --self-manage"

# Prompt
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# OH-My-Zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/chucknorris", from:oh-my-zsh
zplug "plugins/compleat", from:oh-my-zsh
zplug "plugins/completion", from:oh-my-zsh
zplug "plugins/dircycle", from:oh-my-zsh
zplug "plugins/dirhistory", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/git_remote_branch", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/last-working-dir", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/sudo",              from:oh-my-zsh
zplug "plugins/virtualenvwrapper", from:oh-my-zsh

zplug "skywind3000/z.lua"
zplug "aperezdc/zsh-fzy"
#zplug "changyuheng/fz", from:github, defer:"1"
#zplug "andrewferrier/fzf-z", from:github

# ZAW/CDR
zplug "zsh-users/zaw", from:github
zplug "willghatch/zsh-cdr", from:github

# Readline improvements
zplug "b4b4r07/enhancd", use:init.sh
zplug "hlissner/zsh-autopair", from:github, as:"plugin"
zplug "knu/zsh-manydots-magic", from:github 
zplug "zsh-users/zsh-autosuggestions", from:github, defer:2
zplug "zsh-users/zsh-completions", from:github

# History
zplug "b4b4r07/zsh-history-enhanced", from:github
zplug "zsh-users/zsh-history-substring-search", from:github, defer:3

# Colors
zplug 'zdharma/fast-syntax-highlighting', hook-load:'FAST_HIGHLIGHT=()'

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

# zplug check returns true if the given repository exists
if zplug check b4b4r07/enhancd; then
    # setting if enhancd is available
    export ENHANCD_FILTER=fzf-tmux
fi
