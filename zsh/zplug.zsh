#!/usr/local/bin/zsh
# -----------------------------------------------------------------------------
# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# Name: Andrew Kuttor
# Mail: andrew.kuttor@gmail.com
# -----------------------------------------------------------------------------

# SELF MANAGE
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# PROMPT
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# MISC
zplug "b4b4r07/enhancd", use:init.sh
zplug "hlissner/zsh-autopair", from:github, as:"plugin"
zplug "knu/zsh-manydots-magic", from:github 
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/chucknorris", from:oh-my-zsh
zplug "plugins/dircycle", from:oh-my-zsh
zplug "plugins/dirhistory", from:oh-my-zsh
zplug "plugins/last-working-dir", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/virtualenvwrapper", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions", from:github, defer:2
zplug "zsh-users/zsh-completions", from:github

# COMPLETION 
zplug "plugins/compleat", from:oh-my-zsh
zplug "plugins/completion", from:oh-my-zsh
zplug "glidenote/hub-zsh-completion"
zplug "Valodim/zsh-curl-completion"

# GIT
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/git_remote_branch", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh

# 
zplug "skywind3000/z.lua"
zplug "aperezdc/zsh-fzy"
zplug "changyuheng/fz", from:github, defer:"1"
zplug "andrewferrier/fzf-z", from:github

# HISTORY
zplug "plugins/history", from:oh-my-zsh
zplug "b4b4r07/zsh-history-enhanced", from:github
zplug "zsh-users/zsh-history-substring-search", from:github, defer:3
zplug "xav-b/zsh-extend-history"

# COLORS
zplug "zdharma/fast-syntax-highlighting", hook-load:'FAST_HIGHLIGHT=()'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose
then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
