#!/usr/local/bin/zsh
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
#eval "$(stack --bash-completion-script stack)"

zstyle ':completion:*'           completer _oldlist _complete
zstyle ':completion:*'           insert-tab pending
zstyle ':completion:*'           list-colors ''
zstyle ':completion:*'           matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*'           rehash true
zstyle ':completion:*'           special-dirs true
zstyle ':completion:*:*:*:*:*'   menu select
zstyle ':completion:*:cd:*'      ignore-parents parent pwd
zstyle ':completion:*:warnings'  format "zsh: no matches found."
zstyle ':completion::complete:*' use-cache 1

# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic gdb
