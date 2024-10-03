#! /usr/bin/env zsh

# =============================================================================
# -- completion system customizing --------------------------------------------
# =============================================================================
initialize_completions()

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' complete-options true
zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' condition 0
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-list all
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' match-original both
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[]=** r:|=**' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' separate-sections true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-cache  true
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:*:*:corrections' format '%F{red}!- %d (errors: %e) -!%f'
zstyle ':completion:*:cd:*' group-order local-directories path-directories
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle :compinstall filename "$DOTFILES/configs/zsh/completions.zsh"

# -- completion styles --
#zstyle ':completion:*:messages'     format '%F{yellow}%d'
#zstyle ':completion:*:warnings'     format '%B%F{red}No matches for:''%F{white}%d%b'
#zstyle ':completion:*:descriptions' format '%B%F{white}--- %d ---%f%b'
#zstyle ':completion:*:corrections'  format ' %F{green}%d (errors: %e) %f'
#zstyle ':completion:*:options'      description 'yes'
autoload -Uz compinit
compinit
# End of lines added by compinstall
