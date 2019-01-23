#!/usr/local/bin/zsh

autoload -U compinit && compinit -i

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"r":|[._-]=* r:|=*" "l:|=* r:|=*"
zstyle ":completion:*" accept-exact "*(N)"
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "${HOME}/.zsh/cache"
zstyle "completion:*" squeeze-slashes true
zstyle ":completion:*:functions" ignored-patterns "_*"
zstyle ":completion:*"completer _complete _match _approximate
zstyle ":completion:*:match:*" original only
zstyle ":completion:*:approximate:*" max-errors "reply=($((($#PREFIX+$#SUFFIX)/3))numeric)"
zstyle ":completion:*:cd:*" ignore-parents parent pwd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ":completion:*" rehash true
zstyle ":completion:*" special-dirs true
zstyle ":completion:*:*:*:*:*" menu select
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ":completion:*" completer _oldlist _complete
zstyle ":completion:*" insert-tab pending
zstyle ":completion:*" matcher-list "m:{[:lower:]}={[:upper:]}"
zstyle ":completion:*:warnings" format "%BAint found sheeeit...%d%b"
zstyle ":completion:*" auto-description "specify: %d"
zstyle ":completion:*" completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix

# Generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic gdb

