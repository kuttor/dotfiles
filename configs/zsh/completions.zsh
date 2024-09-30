#! /usr/bin/env zsh

# =============================================================================
# -- completions --------------------------------------------------------------
# =============================================================================

zinit for @RobSis/zsh-completion-generator

zstyle ':completion:*' use-cache true
zstyle ':completion:*' menu select=1
zstyle ':completion:*' separate-sections true
zstyle ':completion:*' file-sort 'modification'
zstyle ':completion:*' verbose true
zstyle ':completion:*' completer _oldlist _complete _ignored _expand _approximate _history _correct _match
zstyle ':completion:*' group-name ''
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' group-order local-directories path-directories
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:make::' tag-order targets:

# -- completion styles --
zstyle ':completion:*:messages'     format '%F{yellow}%d'
zstyle ':completion:*:warnings'     format '%B%F{red}No matches for:''%F{white}%d%b'
zstyle ':completion:*:descriptions' format '%B%F{white}--- %d ---%f%b'
zstyle ':completion:*:corrections'  format ' %F{green}%d (errors: %e) %f'
zstyle ':completion:*:options'      description 'yes'
