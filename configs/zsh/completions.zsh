#! /usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

autoload -U compinit && compinit
zmodload -i zsh/complist

# ==============================================================================
# -- Completion Plugins -- "load later, turbo enabled completions"

# ==============================================================================
zinit default-ice -cq wait"1" lucid light-mode id-as

zinit for \
  RobSis/zsh-completion-generator \
  z-shell/zsh-fancy-completions \
  chitoku-k/fzf-zsh-completions \
  lincheney/fzf-tab-completion \
  depth=1 \
  atpull"zinit cclear && zinit creinstall" \
  atload"autoload -Uz compinit && compinit -u" \
  @sainnhe/zsh-completions \
  nocd \
  depth"1" \
  atinit"ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true" \
  3v1n0/zsh-bash-completions-fallback \
  blockf \
  nocompile \
  ver"zinit-fixed" \
  as"completion" \
  mv"git-completion.zsh -> _git" \
  @iloveitaly/git-completion

# -- rust completions --
zinit for \
  atload="hook rust-completions.atload.zsh" \
  as"null" \
  rustup \
  sbin"bin/*" \
  zdharma-continuum/null

zinit nocompile nocompletions for 'MenkeTechnologies/zsh-more-completions'

# -- Oh-My-Zsh Completions --
zinit for \
  OMZP::terraform/_terraform \
  OMZP::fd/_fd \
  OMZP::ag/_ag \
  OMZP::pip/_pip \
  OMZP::ripgrep/_ripgrep

# ==============================================================================
# -- completion options --------------------------------------------------------
# ==============================================================================

# # man zshcontrib
# zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
# zstyle ':vcs_info:*' enable git #svn cvs

# -- general --
zstyle ":completion:*" verbose yes
zstyle ':completion:*' use-cache 'true'
zstyle ':completion:*' rehash 'true'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' insert-tab 'pending'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' extra-verbose 'yes'
zstyle ':completion:*' auto-description
zstyle ':completion:*' accept-exact '*(N)'

# -- file and folder --
zstyle ':completion:*' file-patterns '%p:globbed-files' '*(-/):directories' '*:all-files'
zstyle ':completion:*' file-sort 'modification'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' list-dirs-first 'true'
zstyle ':completion:*' special-dirs 'true'
zstyle ":completion:*" tag-order 'named-directories path-directories files aliases builtins functions commands parameters'

# -- menu --
zstyle ':completion:*' menu select 'long'
zstyle ':completion:*' menu select '2'
zstyle ':completion:*' recent-dirs-insert 'both'

# --cache --
zstyle ':completion:*' cache-path '$XDG_CACHE_HOME/zsh'

# -- manpage --
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# -- format --
zstyle ':completion:*:corrections' format '%F{green}  %d (errors: %e)  %f'
zstyle ':completion:*:descriptions' format '%F{blue}  %d  %f'
zstyle ':completion:*:messages' format '%B%F{magenta}  %U%d%u  %f%b'
zstyle ':completion:*:warnings' format '%B%F{red} %Uno matches found%u %f%b'

# -- make completion is slow --
zstyle ':completion:*:make::' tag-order targets:
zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:*:*make:*:targets' command awk \''/^[a-zA-Z0-9][^\/\t=]+:/ {print $1}'\' \$file

# -- preview `kill` and `ps` commands --
zstyle ":completion:*:*:*:*:processes" command "ps -u $USER -o pid,user,comm -w -w"

# -- add custom completions here --
zicompdef _gnu_generic ar curl ls docker emacs ffmpeg ffprobe fzf pip \
  gocryptfs highlight tlp light lighttpd lsd mimeo hexyl tlmgr vue \
  notify-send wget pip3 pw-cli rofi rustc tlmgr tlp-stat mv \
  grep mkdir rm rmdir rsync scp ssh tar unzip xargs xz zip parallel