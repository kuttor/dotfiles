#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# Deprecating zshenv in favor for zprofile
[[ -f /etc/zshenv && -f /etc/zprofile ]] &&
  sudo mv /etc/zshenv /etc/zprofile

# Zinit Autoinstaller
[[ ! -f "${ZINIT_HOME}/zinit.zsh" ]] &&
  git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}
source "${ZINIT_HOME}/zinit.zsh"

# Powerlevel10k
zinit for \
lucid \
light-mode \
depth="1" \
atload"${CONFIGS}/p10k-instant.zsh" \
@romkatv/powerlevel10k

# ------------------------------------------------------------------------------
# ~ ZSH Annexes ~

zinit light-mode lucid for \
zdharma-continuum/zinit-annex-meta-plugins \
zdharma-continuum/zinit-annex-default-ice \
zdharma-continuum/zinit-annex-link-man \
zdharma-continuum/zinit-annex-pull \
zdharma-continuum/zinit-annex-man \
annexes \
zsh-users+fast \
ext-git

# ------------------------------------------------------------------------------
# ~ Zinit Plugins ~

zinit pack for \
ls_colors \
dircolors-material

zinit for \
zdharma-continuum/zzcomplete \
zdharma-continuum/zsh-lint \
zdharma-continuum/zsh-sweep \
zdharma-continuum/git-url \
zdharma-continuum/zui \
NICHOLAS85/z-a-linkbin \
NICHOLAS85/z-a-eval

# ------------------------------------------------------------------------------
# ~ Turbo GH-Release Programs Delayed Start ~

# Clearing and setting previous ICE defaults
zinit default-ice -cq \
as"program" \
from"gh-r" \
wait"1" \
lucid \
light-mode

# tealdeer ~ A very fast implementation of tldr in Rust
zinit for \
dl"https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer -> _tealdeer" \
atpull"!git reset --hard" \
lbin"tealdeer-* -> tldr" \
pick"tldr" \
@dbrgn/tealdeer

# eza ~ A simple and fast Zsh plugin manager
zinit for \
lbin"*eza -> eza" \
pick"eza" \
atload"hook eza.atload.zsh" \
dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza" \
@eza-community/eza
# zinit for \
# atload"source ${CONFIGS}/eza.zsh" \
# https://github.com/eza-community/eza/blob/main/completions/zsh/_eza

# fd ~ A simple, fast and user-friendly alternative to find
zinit for \
lbin"**fd -> fd" \
pick"fd/fd" \
atload"hook fd.atload.zsh" \
atclone"hook fd.atclone.zsh" \
@sharkdp/fd

# bat ~ A cat(1) clone with wings
zinit for \
lbin"**bat -> bat" \
pick"bat/bat" \
atload"hook bat.atload.zsh" \
atclone"hook bat.atclone.zsh" \
@sharkdp/bat

# delta ~ A viewer for git and diff output
zinit for \
atload"export DELTA_PAGER='less -R -F -+X --mouse'" \
dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
lbin"delta-*/delta -> delta" \
@dandavison/delta

# zoxide ~ A smarter cd command
zinit for \
atload"hook zoxide.atload.zsh" \
lbin"zoxide* -> zoxide" \
@ajeetdsouza/zoxide
# zinit for \
# atload"hook zoxide.atload.zsh" \
# mv"zoxide* -> zoxide" \
# lman"zoxide" \
# @ajeetdsouza/zoxide
zinit for \
lbin"zsh-alias-matcher* -> zsh-alias-matcher" \
decayofmind/zsh-fast-alias-tips

# ------------------------------------------------------------------------------
# ~ Turbo Programs with Delayed Start ~

# Clearing and setting previous ICE defaults
zinit default-ice -cq \
wait"1" \
lucid \
light-mode

# diff-so-fancy ~ Make git diff output more readable
zinit for \
lbin"bin/git-dsf -> git-dsf" \
zdharma-continuum/zsh-diff-so-fancy

# zeno ~ A simple and powerful Zsh prompt
zinit for \
depth"1" \
blockf \
atload"source ${CONFIGS}/zeno/zeno" \
lbin"zeno -> zeno" \
yuki-yano/zeno.zsh

# yank ~ Yank terminal output to clipboard
zinit for \
make \
lbin"yank -> yank" \
@mptre/yank

# tmux ~ Terminal multiplexer
zinit for \
configure'--disable-utf8proc' \
make \
lbin"!tmux*" \
@tmux/tmux

# ------------------------------------------------------------------------------
# ~ Shell Enhancements ~

# Clearing and setting previous ICE defaults
zinit default-ice -cq \
wait"0" \
lucid \
light-mode

# Zsh-Safe-Rm ~ Prevents accidental deletion of files
zinit for \
lbin"**/* -> *" \
unixorn/warhol.plugin.zsh \
@mattmc3/zsh-safe-rm

# Zsh-Autopair ~ Auto-pairing quotes, brackets, etc in command line
zinit for \
compile"*.zsh" \
nocompletions \
atload"hook zsh-autopair.atload.zsh" \
atinit"hook zsh-autopair.atinit.zsh" \
hlissner/zsh-autopair

# iTerm2 integration ~ Shell integration for iTerm2
zinit for \
if'[[ "$TERM_PROGRAM" = "iTerm.app" ]]' \
pick"shell_integration/zsh" \
sbin"utilities/*" \
gnachman/iTerm2-shell-integration

# ------------------------------------------------------------------------------
# ~ Completions ~

zinit default-ice -cq \
wait"0" \
lucid \
light-mode

zinit for \
chitoku-k/fzf-zsh-completions \
z-shell/zsh-fancy-completions \
depth=1 \
atload"autoload -Uz compinit && compinit -u" \
atpull"zinit cclear && zinit creinstall sainnhe/zsh-completions" \
sainnhe/zsh-completions \
nocd \
depth=1 \
atinit='ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true' \
3v1n0/zsh-bash-completions-fallback

# ------------------------------------------------------------------------------
# # ~ Zinit Commons ~
# zinit default-ice -cq wait"0" lucid light-mode

# zinit for \
# atinit"hook fast-syntax-highlighting.atinit.zsh" \
# atload"hook fast-syntax-highlighting.atload.zsh" \
# @zdharma-continuum/fast-syntax-highlighting \
# atinit"hook zsh-autosuggestions.atinit.zsh" \
# atload"hook zsh-autosuggestions.atload.zsh" \
# @zsh-users/zsh-autosuggestions \
# blockf \
# atpull"hook zsh-completions.atpull.zsh" \
# @zsh-users/zsh-completions

# ------------------------------------------------------------------------------
# ~ compinit + cdreplay ~

#autoload -Uz compinit && compinit
[[ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]] &&
compinit || compinit -C

zinit cdreplay -q

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "${CONFIGS}/.p10k.zsh" ]] || source "${CONFIGS}/.p10k.zsh"
