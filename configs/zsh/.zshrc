#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# p10k instant prompt
local p10i="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && \
    . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

### Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
skip_global_compinit=1

# Zinit Annexes
zinit light-mode lucid for                   \
zdharma-continuum/zinit-annex-binary-symlink \
zdharma-continuum/zinit-annex-meta-plugins   \
zdharma-continuum/zinit-annex-default-ice    \
zdharma-continuum/zinit-annex-as-monitor     \
zdharma-continuum/zinit-annex-link-man       \
zdharma-continuum/zinit-annex-pull           \
zdharma-continuum/zinit-annex-man            \
annexes                                      \
zsh-users+fast                               \
zdharma2                                     \
zdharma                                      \
ext-git

# ~ ----------------------------------------------------------------------------
zinit default-ice -cq wait"0" lucid light-mode
# ~ ----------------------------------------------------------------------------

# Prompt: Powerlevel10k
zinit for                              \
  depth="1"                            \
  atload"hook p10k-instant.atload.zsh" \
@romkatv/powerlevel10k

# ------------------------------------------------------------------------------
# ~ fzf
# ------------------------------------------------------------------------------

# fzf ~ A command-line fuzzy finder
zinit pack"bgn-binary+keys" for fzf

# fzf-preview ~ adds a popup window via tmux within standard shell mode
zinit for                             \
  atload"hook fzf-preview.atload.zsh" \
  blockf                              \
  depth"1"                            \
@yuki-yano/fzf-preview.zsh

# fzf-tab ~ A powerful completion engine for Zsh that uses fzf
zinit for                         \
  atload"hook fzf-tab.atload.zsh" \
@Aloxaf/fzf-tab

# Zsh-fzf-utils ~ A collection of utilities for fzf and Zsh
zinit for \
redxtech/zsh-fzf-utils

# ------------------------------------------------------------------------------
# ~ TMUX ~
# ------------------------------------------------------------------------------

zinit id-as for                 \
  cmake                         \
@thewtex/tmux-mem-cpu-load      \
  configure'--disable-utf8proc' \
  make                          \
@tmux/tmux

# ------------------------------------------------------------------------------
# Source the ZSH RC files
# ------------------------------------------------------------------------------

[[ -d "$ZDOTDIR" ]] && for i in "$ZDOTDIR"/rc/*.zsh; do . "$i"; done

# ------------------------------------------------------------------------------
# ~ Oh My Zsh Enhancments~
# ----------------------------------------------------------------------------

# -- Libraries --
zinit for                         \
OMZ::lib/completion.zsh           \
OMZ::lib/compfix.zsh              \
OMZ::lib/correction.zsh           \
OMZ::lib/directories.zsh          \
OMZ::lib/functions.zsh            \
OMZ::lib/git.zsh                  \
OMZ::lib/history.zsh              \
OMZ::lib/misc.zsh                 \
OMZ::lib/termsupport.zsh          \
OMZ::lib/theme-and-appearance.zsh \
OMZ::lib/vcs_info.zsh

# -- Plugins --
zinit for                             \
OMZ::plugins/aws                      \
OMZ::plugins/colored-man-pages        \
OMZ::plugins/colorize                 \
OMZ::plugins/common-aliases           \
OMZ::plugins/composer                 \
OMZ::plugins/copyfile                 \
OMZ::plugins/copypath                 \
OMZ::plugins/cp                       \
OMZ::plugins/extract                  \
OMZ::plugins/fancy-ctrl-z             \
OMZ::plugins/git                      \
OMZ::plugins/github                   \
OMZ::plugins/gitignore                \
OMZ::plugins/nvm                      \
OMZ::plugins/pip                      \
OMZ::plugins/sudo                     \
OMZ::plugins/ssh-agent                \
OMZ::plugins/urltools                 \
OMZ::plugins/tmux                     \
OMZ::plugins/vscode                   \
OMZ::plugins/web-search               \
  atload"hook magic-enter.atload.zsh" \
OMZ::plugins/magic-enter

# ~-----------------------------------------------------------------------------
zinit default-ice -cq wait"0" lucid light-mode
# ~-----------------------------------------------------------------------------

# ls_colors ~ A collection of LS_COLORS definitions
zinit pack for ls_colors

# dircolors-material ~ A dircolors theme inspired by Material Design
zinit pack for dircolors-material

# Warhol ~ A Zsh plugin for syntax highlighting
zinit for unixorn/warhol.plugin.zsh

# jq ~ A lightweight and flexible command-line JSON processor
zinit for       \
  from'gh-r'    \
  sbin'* -> jq' \
  nocompile     \
@jqlang/jq

# lsd ~ The next gen ls command
zinit for                     \
  from'gh-r'                  \
  as'program'                 \
  bpick'lsd-*'                \
  pick'lsd-*/lsd'             \
  atload'hook lsd.atload.zsh' \
  sbin'lsd -> lsd'            \
@lsd-rs/lsd

# Neovim ~ The next gen Vim
zinit for               \
  from'gh-r'            \
  sbin'**/nvim -> nvim' \
  ver'nightly'          \
neovim/neovim

# zsh-fnm ~ Fast node manager for Zsh
zinit for \
dominik-schwabe/zsh-fnm

# -----------------------------------------------------------------------------
# ~ Code Helpers ~ Linters, LSPs, etc. ~
# -----------------------------------------------------------------------------

## zsh
zinit for \
zdharma-continuum/{zsh-lint,zsh-sweep}

# shell
zinit for               \
  from'gh-r'            \
  sbin'**/sh* -> shfmt' \
@mvdan/sh

# ZDharma Maintained Plugins
zinit for                                           \
  atinit'hook history-search-multi-word.atinit.zsh' \
zdharma-continuum/history-search-multi-word         \
  atload'hook zsh-startify.atload.zsh'              \
zdharma-continuum/zsh-startify                      \
zdharma-continuum/zzcomplete                        \
zdharma-continuum/git-url                           \
NICHOLAS85/z-a-linkbin                              \
NICHOLAS85/z-a-eval

# zsh-safe-rm ~ prevent the accidental deletion of important files
zinit for \
mattmc3/zsh-safe-rm

# Zsh-Autopair ~ Auto-pairing quotes, brackets, etc in command line
zinit for \
  nocompletions \
  compile'*.zsh' \
  atload'hook zsh-autopair.atload.zsh' \
  atinit'hook zsh-autopair.atinit.zsh' \
hlissner/zsh-autopair

# Auto installs the iTerm2 shell integration for Zsh
zinit for \
  pick'shell_integration/zsh' \
  sbin'utilities/*' \
gnachman/iTerm2-shell-integration

# git-fuzzy ~ A CLI interface to git that relies on fzf
zinit for \
  as'program' \
  pick'bin/git-fuzzy' \
  sbin'git-fuzzy -> git-fuzzy' \
bigH/git-fuzzy

# Neofetch ~ A command-line system information tool
zinit for \
  make \
@dylanaraps/neofetch

# ~-----------------------------------------------------------------------------
zinit default-ice -cq from"gh-r" wait"1" lucid light-mode
# ~-----------------------------------------------------------------------------

# lazygit ~ A simple terminal UI for git commands
zinit for          \
  sbin'**/lazygit' \
jesseduffield/lazygit

zinit for     \
  sbin'**/gh' \
cli/cli

# tealdeer ~ A very fast implementation of tldr in Rust
zinit for                                                                              \
  dl'https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer -> _tealdeer' \
  sbin'tealdeer-* -> tldr'                                                             \
@dbrgn/tealdeer

# eza ~ A simple and fast Zsh plugin manager
zinit for                                                                         \
  atclone'hook eza.atclone.zsh'                                                   \
  atload'hook eza.atload.zsh'                                                     \
  atpull'%atclone'                                                                \
  pick'eza.zsh'                                                                   \
  dl'https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza' \
  sbin'eza -> eza'                                                                \
@eza-community/eza

# rg ~ Faster GREP replacement
zinit for           \
  sbin'**/rg -> rg' \
BurntSushi/ripgrep

# fd ~ Faster FIND replacement
zinit for                      \
  id-as                        \
  atclone'hook fd.atclone.zsh' \
  atload'hook fd.atload.zsh'   \
  sbin'**/fd -> fd'            \
  null                         \
@sharkdp/fd

# bat ~ A cat clone with wings
zinit for                       \
  id-as                         \
  atclone'hook bat.atclone.zsh' \
  atload'hook bat.atload.zsh'   \
  sbin'**/bat -> bat'           \
  null                          \
@sharkdp/bat

# delta ~ A viewer for git and diff output
zinit for \
  sbin'**/delta -> delta' \
dandavison/delta

# glow ~ A markdown reader for the terminal
zinit for \
  sbin'glow -> glow' \
charmbracelet/glow

# zoxide ~ A smarter cd command
zinit for \
  atload'hook zoxide.atload.zsh' \
  sbin'zoxide -> zoxide' \
@ajeetdsouza/zoxide

# ~-----------------------------------------------------------------------------
zinit default-ice -cq wait"1" lucid light-mode
# ~-----------------------------------------------------------------------------

# github-Copilot ~ A CLI for GitHub Copilot
zinit snippet https://gist.githubusercontent.com/iloveitaly/a79ffc31ef5b4785da8950055763bf52/raw/4140dd8fa63011cdd30814f2fbfc5b52c2052245/github-copilot-cli.zsh

# diff-so-fancy ~ Make git diff output more readable
zinit for                      \
  sbin'bin/git-dsf -> git-dsf' \
zdharma-continuum/zsh-diff-so-fancy

# history-search-multi-word ~ Make git history search
zinit for \
  wait'1' \
  atinit'hook history-search-multi-word.atinit.zsh' \
zdharma-continuum/history-search-multi-word

# zeno ~ A simple and powerful Zsh prompt
zinit for \
  atload'source ${HOME}/.dotfiles/configs/zeno/zeno' \
  blockf \
  depth"1" \
  sbin"bin/zeno -> zeno" \
yuki-yano/zeno.zsh

# yank ~ Yank terminal output to clipboard
zinit for \
  make \
  sbin"yank.1 -> yank" \
@mptre/yank

# make sure you execute this *after* asdf or other version managers are loaded
if (( $+commands[github-copilot-cli] )); then
eval "$(github-copilot-cli alias -- "$0")"
fi

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "${CONFIGS}/.p10k.zsh" ]] || source "${CONFIGS}/.p10k.zsh"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/configs/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/configs/zsh/.p10k.zsh ]] || source ~/.dotfiles/configs/zsh/.p10k.zsh
