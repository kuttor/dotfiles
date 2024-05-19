#! /usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

setopt prompt_subst # Pass escape sequence (environment variable) through prompt

# ~=============================================================================
# -- Completion Plugins -- "load later, turbo enabled completions"
zinit default-ice -cq wait"1" lucid light-mode
# ~=============================================================================

# completions.zsh ~ personal completions for dotfiles
zinit snippet "$ZSH_CONFIG_DIR/completions.zsh"

# system completions ~  moves zsh system completions under control of zinit
zinit wait pack atload=+"zicompinit; zicdreplay" for system-completions

zinit for RobSis/zsh-completion-generator

zinit for z-shell/zsh-fancy-completions

zinit for chitoku-k/fzf-zsh-completions

zinit for lincheney/fzf-tab-completion

zinit for                                      \
  depth=1                                      \
  atpull"zinit cclear && zinit creinstall"     \
  atload"autoload -Uz compinit && compinit -u" \
@sainnhe/zsh-completions


zinit for                                                     \
  nocd                                                        \
  depth"1"                                                    \
  atinit"ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true" \
3v1n0/zsh-bash-completions-fallback

zinit for                        \
  blockf                         \
  nocompile                      \
  ver"zinit-fixed"               \
  as"completion"                 \
  mv"git-completion.zsh -> _git" \
@iloveitaly/git-completion


# Oh-My-Zsh Completions
zinit for                  \
OMZP::terraform/_terraform \
OMZP::fd/_fd               \
OMZP::ag/_ag               \
OMZP::pip/_pip

zicompdef _gnu_generic aomenc ar aria2c bandwhich curl cwebp cjxl darkhttpd direnv docker   \
          dunst emacs feh ffmpeg ffprobe flask fsck.ext4 fzf gocryptfs hexyl highlight tlp  \
          histdb inkscape ktlint light lighttpd lsd mimeo megadl mkfs.vfat nzbget tlmgr vue \
          tlp-stat notify-send pamixer pip pip3 pipx psmem pw-cli rofi rustc tlmgr tlp-stat \
          vue zstd

# ~=============================================================================
# -- Zstyle Completion Options --
# ~=============================================================================

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' \
hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Set completion options
zstyle ':completion:*' auto-description
zstyle ':completion:*' file-patterns '%p:globbed-files' '*(-/):directories' '*:all-files'
zstyle ':completion:*' list-dirs-first true
zstyle ":completion:*" accept-exact "*(N)"
zstyle ":completion:*" cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ":completion:*" extra-verbose yes
zstyle ":completion:*" file-sort modification
zstyle ":completion:*" format "Completing %d"
zstyle ":completion:*" fzf-completion-keybindings "${keys[@]}"
zstyle ":completion:*" fzf-search-display true
zstyle ":completion:*" group-name ""
zstyle ":completion:*" insert-tab pending
zstyle ":completion:*" keep-prefix
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
zstyle ":completion:*" menu select "long"
zstyle ":completion:*" menu select=2
zstyle ":completion:*" recent-dirs-insert both
zstyle ":completion:*" rehash true
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" use-cache true
zstyle ":completion:*" verbose yes
zstyle ":completion:*" tag-order "named-directories" "path-directories" "files" "aliases" "builtins" "functions" "commands" "parameters"

zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections   true

zstyle ':completion:*:corrections'   format '%F{green}  %d (errors: %e)  %f'
zstyle ':completion:*:descriptions'  format '%F{blue}  %d  %f'
zstyle ':completion:*:messages'      format '%B%F{magenta}  %U%d%u  %f%b'
zstyle ':completion:*:warnings'      format '%B%F{red} %Uno matches found%u %f%b'


# Basic file preview for ls
zstyle ":completion::*:ls::*" \
fzf-completion-opts --preview="eval head ${1}"

# Preview when completing env vars
zstyle ":completion::*:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" \
fzf-completion-opts --preview="eval echo ${1}"

# Preview a `git status` when completing git add
zstyle ":completion::*:git::git,add,*" \
fzf-completion-opts --preview="git -c color.status=always status --short"

# If other subcommand to git is given, show a git diff or git log
zstyle ":completion::*:git::*,[a-z]*" \
fzf-completion-opts --preview="eval set -- {+1} for arg in "$@"; do { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null; done"

# Complete variable subscripts
zstyle ":completion:*:default" \
menu "select=1" # Show Menu for 1 or more items

# Display man completion by section number
zstyle ":completion:*:manuals" separate-sections true

# Make completion is slow
zstyle ":completion:*:make::"            tag-order targets:
zstyle ":completion:*:make:*:targets"    call-command true
zstyle ":completion:*:*:*make:*:targets" command awk \""/^[a-zA-Z0-9][^\/\t=]+:/ {print $1}"\" \$file

# Complete with fzf-tab
zstyle ":autocomplete:*" widget-style menu-select

# Set fzf-tab completion options
zstyle ":fzf-tab:*" switch-group "," "."
zstyle ":fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" fzf-preview "echo ${(P)word}"

# Preview `kill` and `ps` commands
zstyle ":completion:*:*:*:*:processes" command "ps -u $USER -o pid,user,comm -w -w"

# Preview `git` commands
zstyle ":fzf-tab:complete:git-(add|diff|restore):*" \
fzf-preview "git diff $word | delta"

# Preview `git log`
zstyle ":fzf-tab:complete:git-log:*" \
fzf-preview "git log --color=always $word"

# Preview `git help`
zstyle ":fzf-tab:complete:git-help:*" \
fzf-preview "git help $word | bat -plman --color=always"

# Preview HELP
zstyle ":fzf-tab:complete:(\\|)run-help:*" \
fzf-preview "run-help $word"

# Preview MAN
zstyle ":fzf-tab:complete:(\\|*/|)man:*" \
fzf-preview "man $word"

# Set fzf-tab completion command
zstyle ":fzf-tab:*" \
fzf-command fzf

# Preview `cd`
zstyle ":fzf-tab:complete:cd:*"\
fzf-preview "exa -1 --color=always $realpath"
