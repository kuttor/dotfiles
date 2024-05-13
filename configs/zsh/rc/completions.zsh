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
zinit for RobSis/zsh-completion-generator
zinit for z-shell/zsh-fancy-completions
zinit for chitoku-k/fzf-zsh-completions
zinit for lincheney/fzf-tab-completion

zinit for \
  depth=1 \
  atpull"
    zinit cclear && zinit creinstall
  " \
  atload"
    autoload -Uz compinit && compinit -u
  " \
@sainnhe/zsh-completions


zinit for \
  nocd \
  depth"1" \
  atinit"
    ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true
  " \
3v1n0/zsh-bash-completions-fallback \
  
zinit for \
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
zstyle ':completion:*' fzf-search-display true
zstyle ':completion:*' extra-verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-tab pending # Pasted text with tabs doesnt complete
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
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

# fzf-tab-completion testing
# press ctrl-r to repeat completion *without* accepting i.e. reload the completion
# press right to accept the completion and retrigger it
# press alt-enter to accept the completion and run it
keys=(
    ctrl-r:'repeat-fzf-completion'
    right:accept:'repeat-fzf-completion'
    alt-enter:accept:'zle accept-line'
)
# basic file preview for ls (you can replace with something more sophisticated than head)
zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'

# preview when completing env vars (note: only works for exported variables)
# eval twice, first to unescape the string, second to expand the $variable
zstyle ':completion::*:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-completion-opts --preview='eval eval echo {1}'

# preview a `git status` when completing git add
zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'

# if other subcommand to git is given, show a git diff or git log
zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='
eval set -- {+1}
for arg in "$@"; do
    { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null
done'

zstyle ':completion:*' fzf-completion-keybindings "${keys[@]}"
# also accept and retrigger completion when pressing / when completing cd
zstyle ':completion::*:cd:*' fzf-completion-keybindings "${keys[@]}" /:accept:'repeat-fzf-completion'


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





zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	   fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:(cd|ls|lsd|exa|eza|bat|cat|emacs|nano|vi|vim):*' \
       fzf-preview 'eza -1 --icons --color=always $realpath 2>/dev/null || ls -1 --color=always $realpath'
# Preivew `kill` and `ps` commands
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
       '[[ $group == "[process ID]" ]] &&
        if [[ $OSTYPE == darwin* ]]; then
            ps -p $word -o comm="" -w -w
        elif [[ $OSTYPE == linux* ]]; then
            ps --pid=$word -o cmd --no-headers -w -w
        fi'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags '--preview-window=down:3:wrap'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# Preivew `git` commands
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	   'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	   'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	   'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	   'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	   'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'

# Preview HELP
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
