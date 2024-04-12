#!/usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

[[ "command -v fzf-preview" >/dev/null ]]&&\
zstyle ":fzf-tab:complete:(cd|ls|lsd|exa|eza|bat|cat|emacs|nano|vi|vim):*" \
fzf-preview "lsd -1 $(realpath) || ls -1 $(realpath)" &&\
zstyle ":fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" \
fzf-preview "echo ${(P)word}" &&\
zstyle ":fzf-tab:complete:git-(add|diff|restore):*" \
fzf-preview "git diff $word | delta" &&\
zstyle ':fzf-tab:complete:(\\|)run-help:*' \
fzf-preview "run-help ${word}"&&\
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' \
fzf-preview 'brew info $word'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' \
fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' \
fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' \
fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' \
fzf-preview 'case "$group" in 
  "commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;; esac'
zstyle ':fzf-tab:complete:git-checkout:*' \
fzf-preview 'case "$group" in
	"modified file") git diff $word | delta ;;
  "recent commit object name") git show --color=always $word | delta ;;
  *) git log --color=always $word ;;
  esac'
zstyle ':fzf-tab:complete:tldr:argument-1' \
fzf-preview 'tldr --color always $word'
zstyle ':fzf-tab:user-expand:*' \
fzf-preview 'less ${(Q)word}'

FZF_PREVIEW_ENABLE_TMUx=1