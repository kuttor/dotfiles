#!/usr/local/bin/zsh
# The context tells the completion system under what circumstances your
# value will be used.  It has this form:
#  :completion:<function-name>:<completer>:<command>:<argument>:<tag>

# Completion Options
setopt   always_to_end          # curser goes to end after complete
setopt   auto_list              # automatically list choices on ambiguous completion
setopt   auto_menu              # second tab for menu behavior
setopt   auto_param_keys        # smart insert spaces " "
setopt   auto_param_slash       # if completed parameter is a directory, add a trailing slash
setopt   auto_remove_slash      # remove extra slashes if needed
setopt   complete_aliases
setopt   complete_in_word       # complete from both ends of a word
setopt   correct                # autocorrect spelling errors of commands
setopt   correct_all            # autocorrect spelling errors of arguments
setopt   equals                 # perform equals = expansion
setopt   glob_star_short        # **.c == **/*.c
setopt   globdots               # include . filenames in expansions
setopt   extended_glob          # include #, ~, and ^ in expansion
setopt   path_dirs              # perform path search even on command names with slashes
unsetopt case_glob              # make globbing case insensitive
unsetopt menu_complete          # add first of multiple

# enable completion
# autoload -Uz +X bashcompinit && bashcompinit

zmodload -i zsh/complist

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

zstyle ':compinstall' filename "$HOME/.dotfiles/complete.zsh"
zstyle ':completion:*' add-space true
zstyle ':completion:*' auto-description 'Specify %d'
zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix

#zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:parameters' list-colors "=[^a-zA-Z]*=$color[red]"
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' old-list always
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' verbose true
zstyle ':completion:*' extra-verbose ys
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:manuals' separate-sections true

# make autocompletion faster by caching and prefix-only matching
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $CACHE
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

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

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit

if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]
then
  compinit
else
  compinit -C
fi

# Add . hidden files to menu completion
_comp_options+=(globdots)
