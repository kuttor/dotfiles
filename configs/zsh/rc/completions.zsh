#! /usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# ------------------------------------------------------------------------------
# ~ COMPLETIONS ~
# ------------------------------------------------------------------------------

setopt prompt_subst # Pass escape sequence (environment variable) through prompt

# ICE Defaults: Zinit Completions 
zinit default-ice -cq \
as"completion"        \
wait"1"               \
lucid


# plugins 
zi for RobSis/zsh-completion-generator
zi for z-shell/zsh-fancy-completions
zi for chitoku-k/fzf-zsh-completions

zi for \  
  depth"1" \
  atpull"
    zinit cclear && zinit creinstall sainnhe/zsh-completions
  " \
  atload"
    autoload -Uz compinit && compinit -u
  " \
sainnhe/zsh-completions


zi for \
  nocd \
  depth"1" \
  atinit"
    ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true
  " \
3v1n0/zsh-bash-completions-fallback \
  
zi for \
  blockf \
  nocompile \
  ver"zinit-fixed" \
  as"completion" \
  mv'git-completion.zsh -> _git' \
iloveitaly/git-completion


# Oh-My-Zsh Completions
zinit for              \
OMZ::plugins/terraform \
OMZ::plugins/fd/_fd    \
OMZ::plugins/ag/_ag    \
OMZ::plugins/pip/_pip




# force completion generation for more obscure commands
zstyle :plugin:zsh-completion-generator programs \
ncdu \
tre \
cat

# Force Completer names
zstyle ':completion:*' completer \
_oldlist \
_expand \
_complete \
_match \
_ignored \
_approximate

# ~ Completion Color and Formatting ~
zstyle ":completion:*:corrections"  format "%F{green}%d (errors: %e) %f"
zstyle ":completion:*:descriptions" format "%B%F{white}--- %d ---%f%b"
zstyle ":completion:*:messages"     format "%F{yellow}%d"
zstyle ":completion:*:warnings"     format "%B%F{red}No matches for:""%F{white}%d%b"

# ~ Completion Options ~
zstyle ':completion:*:options' description 'yes'

# Completion Options
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path $LOCAL_CACHE/zsh/cache
zstyle ':completion:*' extra-verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-tab pending # Pasted text with tabs doesnt complete
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=long
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*' rehash true
zstyle ':completion:*' special-dirs true              # Highlight special folders
zstyle ':completion:*' use-cache true # Cache completions
zstyle ':completion:*' verbose yes
zstyle ':completion:*' file-sort 'modification'
zstyle ':completion:*' matcher-list \
'm:{a-zA-Z}={A-Za-z}' \
'r:|[._-]=* r:|=*' \
'l:|=* r:|=*'

# autocompletion in privys 
zstyle ':completion::complete:*' gain-privileges 1

zstyle ':completion:*:default' menu select=1 # Show Menu for 1 or more items

# ~ Group Completion ~

# CD
zstyle ':completion:*:cd:*' tag-order \
local-directories \
path-directories
zstyle ':completion:*:cd:*' group-order \
local-directories \
path-directories

# PS
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# Sudo
zstyle ':completion:*:sudo:*' command-path \
/usr/local/sbin \
/usr/local/bin \
/usr/sbin \
/usr/bin \
/sbin \
/bin

# Complete variable subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order \
indexes \
parameters

# Display man completion by section number
zstyle ':completion:*:manuals' separate-sections true

# Make completion is slow
zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:make::' tag-order targets:
zstyle ':completion:*:*:*make:*:targets' command \
awk \''/^[a-zA-Z0-9][^\/\t=]+:/ {print $1}'\' \$file

zstyle ':autocomplete:*' widget-style menu-select
#bindkey -M menu-select '\r' accept-line

zstyle ':completion:*:git-checkout:*' sort false
