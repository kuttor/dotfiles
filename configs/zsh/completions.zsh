#! /usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# ------------------------------------------------------------------------------
# ~ COMPLETIONS ~
# ------------------------------------------------------------------------------

# PRE-SETUP
setopt prompt_subst # Pass escape sequence (environment variable) through prompt

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

zstyle ':completion:*' matcher-list \
'm:{a-zA-Z}={A-Za-z}' \
'r:|[._-]=* r:|=*' \
'l:|=* r:|=*'

# zstyle show completion menu if 1 or more items to select
zstyle ':completion:*:default' menu select=1 # Show Menu for 1 or more items



# ------------------------------------------------------------------------------
# ~ Completion Groups ~
# ------------------------------------------------------------------------------

# CD
zstyle ':completion:*:cd:*' tag-order \
local-directories \
path-directories
zstyle ':completion:*:cd:*' group-order \
local-directories \
path-directories

# completion of ps command
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# completion of sudo command
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

# Display man completions in order of modification date
zstyle ':completion:*' file-sort 'modification'

# Make completion is slow
zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:make::' tag-order targets:
zstyle ':completion:*:*:*make:*:targets' command awk \''/^[a-zA-Z0-9][^\/\t=]+:/ {print $1}'\' \$file

#zstyle ':completion:*:*:*make:*:*' tag-order '!targets !functions !file-patterns'

zstyle ':autocomplete:*' widget-style menu-select
#bindkey -M menu-select '\r' accept-line

# ~ OLD ------------------------------------------------------------------------

## -- Ignore --
#zstyle ':completion::complete:*:*:files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
#zstyle ':completion::complete:*:*:globbed-files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
#zstyle ':completion::complete:rm:*:globbed-files' ignored-patter
#
#
## describe different versions of completion. Test with: cd<tab>
#zstyle ':completion:*:descriptions' format "%F{yellow}--- %d%f"
#zstyle ':completion:*:messages' format '%d'
#
## when no match exists. Test with: cd fdjsakl<tab>
#
## groups matches. Test with cd<tab>
#zstyle ':completion:*' group-name ''
#
## this will only show up if a parameter flag has a name but no description
#zstyle ':completion:*' auto-description 'specify: %d
