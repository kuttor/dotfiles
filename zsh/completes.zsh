#!/usr/local/bin/zsh
# The context tells the completion system under what circumstances your
# value will be used.  It has this form:
#  :completion:<function-name>:<completer>:<command>:<argument>:<tag>

# enable completion
autoload -Uz compinit
compinit

autoload bashcompinit
bashcompinit

zmodload -i zsh/complist

# The following lines were added by compinstall
zstyle ':completion:*' add-space true
zstyle ':completion:*' auto-description 'Specify %d'
zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' old-list always
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '$HOME/.dotfiles/complete.zsh'

# End of lines added by compinstall

# make autocompletion faster by caching and prefix-only matching
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# get better autocompletion accuracy by typing longer words
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# ignore completion functions for commands you don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# completing process IDs with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':filter-select:highlight' matched fg=red
zstyle ':filter-select' max-lines 10
zstyle ':filter-select' rotate-list yes
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search

autoload -Uz compinit && compinit
