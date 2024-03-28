#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# Zinit Autoinstaller
[[ ! -f "${ZINIT_HOME}/zinit.zsh" ]] &&
  git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}
source "${ZINIT_HOME}/zinit.zsh"

# Prompt: Powerlevel10k
zi for \
lucid \
light-mode \
depth="1" \
atload"hook p10k-instant.atload.zsh" \
@romkatv/powerlevel10k

# Zinit Annexes
zi light-mode lucid for \
zdharma-continuum/zinit-annex-binary-symlink \
zdharma-continuum/zinit-annex-meta-plugins \
zdharma-continuum/zinit-annex-default-ice \
zdharma-continuum/zinit-annex-as-monitor \
zdharma-continuum/zinit-annex-link-man \
zdharma-continuum/zinit-annex-pull \
zdharma-continuum/zinit-annex-man \
annexes \
zsh-users+fast \
zdharma2 \
zdharma \
ext-git \
molovo

# ------------------------------------------------------------------------------
zi default-ice -cq \
wait \
lucid \
light-mode
# ------------------------------------------------------------------------------

# ls_colors ~ A collection of LS_COLORS definitions
zi pack for ls_colors

# dircolors-material ~ A dircolors theme inspired by Material Design
zi pack for dircolors-material

# Warhol ~ A Zsh plugin for syntax highlighting
zi for unixorn/warhol.plugin.zsh

zi for \
  atinit'hook history-search-multi-word.atinit.zsh' \
zdharma-continuum/history-search-multi-word \
  atload'hook zsh-startify.atload.zsh' \
zdharma-continuum/zsh-startify \
zdharma-continuum/zzcomplete \
zdharma-continuum/zsh-lint \
zdharma-continuum/zsh-sweep \
zdharma-continuum/git-url \
NICHOLAS85/z-a-linkbin \
NICHOLAS85/z-a-eval

# zsh-safe-rm ~ prevent the accidental deletion of important files
zi for \
mattmc3/zsh-safe-rm

# Zsh-Autopair ~ Auto-pairing quotes, brackets, etc in command line
zi for \
compile"*.zsh" \
nocompletions \
atload"hook zsh-autopair.atload.zsh" \
atinit"hook zsh-autopair.atinit.zsh" \
hlissner/zsh-autopair

# iTerm2 integration ~ Shell integration for iTerm2
zi for \
if'[[ "$TERM_PROGRAM" = "iTerm.app" ]]' \
pick"shell_integration/zsh" \
sbin"utilities/*" \
gnachman/iTerm2-shell-integration

# glow ~ A markdown reader for the terminal
zi for \
sbin'glow_* -> glow' \
charmbracelet/glow

# ------------------------------------------------------------------------------
zi default-ice -cq \
from"gh-r" \
wait"1" \
lucid \
light-mode
# ------------------------------------------------------------------------------

# tealdeer ~ A very fast implementation of tldr in Rust
zi for \
dl"https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer -> _tealdeer" \
sbin"tealdeer-* -> tldr" \
@dbrgn/tealdeer

# eza ~ A simple and fast Zsh plugin manager
zi for \
as'program' \
sbin'**/eza -> eza' \
atload"hook eza.atload.zsh" \
dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza" \
eza-community/eza

# zi for \
# sbin"eza -> eza" \
# atload"hook eza.atload.zsh" \
# dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza" \
# eza-community/eza

# fd ~ A simple, fast and user-friendly alternative to find
zi for \
sbin"fd* -> fd" \
atload"hook fd.atload.zsh" \
atclone"hook fd.atclone.zsh" \
@sharkdp/fd

# bat ~ a cat(1) clone with wings
zi for \
mv"bat-*/bat -> bat" \
atclone"hook bat.atclone.zsh" \
atpull"%atclone" \
atload"hook bat.atload.zsh" \
@sharkdp/bat

# delta ~ A viewer for git and diff output
zi for \
atload"export DELTA_PAGER='less -R -F -+X --mouse'" \
dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
sbin"!delta-*/delta -> delta" \
@dandavison/delta

# zoxide ~ A smarter cd command
zi for \
atload"hook zoxide.atload.zsh" \
sbin"zoxide -> zoxide" \
@ajeetdsouza/zoxide

zi for \
sbin"zsh-alias-matcher -> zsh-alias-matcher" \
decayofmind/zsh-fast-alias-tips

# ------------------------------------------------------------------------------
zi default-ice -cq \
wait"1" \
lucid \
light-mode
# ------------------------------------------------------------------------------

# diff-so-fancy ~ Make git diff output more readable
zi for \
sbin"bin/git-dsf -> git-dsf" \
zdharma-continuum/zsh-diff-so-fancy

# zeno ~ A simple and powerful Zsh prompt
zi for \
depth"1" \
blockf \
atload"source ${CONFIGS}/zeno/zeno" \
sbin"bin/zeno -> zeno" \
yuki-yano/zeno.zsh

# yank ~ Yank terminal output to clipboard
zi for \
make \
sbin"yank.1 -> yank" \
@mptre/yank

# tmux ~ Terminal multiplexer
zi for \
configure'--disable-utf8proc' \
make \
sbin"tmux.1 -> tmux" \
@tmux/tmux

# ------------------------------------------------------------------------------
zi default-ice -cq \
wait"2" \
lucid \
light-mode
# ------------------------------------------------------------------------------

zi for \
chitoku-k/fzf-zsh-completions \
z-shell/zsh-fancy-completions \
  depth"1" \
  atpull"zinit cclear && zinit creinstall sainnhe/zsh-completions" \
  atload"autoload -Uz compinit && compinit -u" \
sainnhe/zsh-completions \
  nocd \
  depth"1" \
  atinit='ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true' \
3v1n0/zsh-bash-completions-fallback

#autoload -Uz compinit && compinit
[[ $(date +'%j') != $(date -r ${LOCAL_CACHE}/.zcompdump +'%j') ]] &&
compinit || compinit -C

zinit cdreplay -q

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "${CONFIGS}/.p10k.zsh" ]] || source "${CONFIGS}/.p10k.zsh"
