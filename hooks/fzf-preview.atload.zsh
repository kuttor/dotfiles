#!/usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0
# vim:set nu clipboard+=unnamedplus

[[ "command -v fzf-preview" >/dev/null ]]&&\
zstyle ":fzf-tab:complete:(cd|ls|lsd|exa|eza|bat|cat|emacs|nano|vi|vim):*" \
fzf-preview "lsd -1 $(realpath) || ls -1 $(realpath)" &&\
zstyle ":fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" \
fzf-preview "echo ${(P)word}" &&\
zstyle ":fzf-tab:complete:git-(add|diff|restore):*" \
fzf-preview "git diff $word | delta" &&\
zstyle ':fzf-tab:complete:(\\|)run-help:*' \
fzf-preview "run-help ${word}"&&\
FZF_PREVIEW_ENABLE_TMUx=1