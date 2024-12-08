#! /usr/bin/env zsh

# start the completion system
initialize_completions

# -- load completions ------------------------------------------------------------------------------------------------
zinit wait'1' id-as'auto' for                                                                                          \
atload'use zsh-completions.atload'                                                                                     \
atpull'use zsh-completions.atpull'                                                                                     \
@sainnhe/zsh-completions

zinit wait'1' id-as'auto' as'completion' for 'https://github.com/chmln/sd/blob/master/gen/completions/_sd'

# -- configure completion system ---------------------------------------------------------------------------------------
zicompdef                                                                                                              \
  _gnu_generic rg git chmod chwown ssh cut which whence type bandwhich curl direnv docker lighttpd                     \
  emacs feh ffmpeg ffprobe fsck.ext4 fzf gocryptfs hexyl highlight histdb light zinit tlp brew vue                     \
  mkdir ssh-keygen zstd lsd sd tre tlrc rip choose mcfly just dog rust cargo go zoxide z zsh nvim 

# -- completion options --
setopt ALWAYS_TO_END AUTO_LIST AUTO_MENU AUTO_PARAM_SLASH AUTO_REMOVE_SLASH
setopt COMPLETE_IN_WORD GLOB_COMPLETE PATH_DIRS

zstyle ':completion:*' list-colors='${(s.:.)LS_COLORS}'
zstyle ':completion:*' list-prompt='%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-separator='→'
zstyle ':completion:*' list-suffixes=true
zstyle ':completion:*' match-original=both
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original=true
zstyle ':completion:*' preserve-prefix='//[^/]##/'
zstyle ':completion:*' select-prompt='%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl=true
zstyle ':completion:*' verbose=true

# Specific completion settings
zstyle ':completion:*:*:*:*:corrections' format '%F{red}!- %d (errors: %e) -!%f'
zstyle ':completion:*:make:*:targets'    call-command true
zstyle ':completion:*:messages'          format ' %F{purple} -- %d --%f'
zstyle ':completion:*:sudo:*'            command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:warnings'          format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default'           select-prompt '%B%S%M%b matches, current selection at %p%s'
zstyle ':completion:*:options'           description 'yes'
zstyle ':completion:*:options'           auto-description ' %F{8}specify:%f %B%F{cyan}%d%f%b'
zstyle ':completion:*:corrections'       format ' %F{8}correction:%f %B%F{green}%d (errors: %f%F{red}%e%f%F{green})%f%b'
zstyle ':completion:*:descriptions'      format ' %F{8}description:%f %B%F{blue}%d%f%b'

zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Ignore multiple entries
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Fuzzy match mistyped completions
zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# ssh, rsync, sftp
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host' 'hosts:-domain:domain' 'hosts:-ipaddr:ip\ address' '*'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^<->.<->.<->.<->' '127.0.0.<->'

# Directories
zstyle ':completion:*:cd:*' group-order local-directories path-directories
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//,/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# file completion patterns
zstyle ':completion:*:*:vim:*' file-patterns '^*.(yaml|yml|py|sh|zsh|pdf|odt|ods|doc|docx|xls|xlsx|odp|ppt|pptx|mp4|mkv|aux):source-files' '*:all-files'
zstyle ':completion:*:*:(build-workshop|build-document):*' file-patterns '*.adoc'


# basic file preview for ls (you can replace with something more sophisticated than head)
# zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'

# preview when completing env vars (note: only works for exported variables)
# eval twice, first to unescape the string, second to expand the $variable
# zstyle ':completion::*:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-completion-opts --preview='eval eval echo {1}'

# preview a `git status` when completing git add
# zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'

# if other subcommand to git is given, show a git diff or git log
# zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='
# eval set -- {+1}
# for arg in "$@"; do
    # { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null
# done
# '

# only for git
zstyle ':completion:*:*:git:*' fzf-search-display true
# or for everything
zstyle ':completion:*' fzf-search-display true

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

zstyle ':fzf-tab:*' fzf-command 'ftb-tmux-popup'