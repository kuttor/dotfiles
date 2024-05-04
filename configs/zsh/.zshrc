#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit Autoinstaller
[[ ! -f "${ZINIT_HOME}/zinit.zsh" ]] &&
  git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}
source "${ZINIT_HOME}/zinit.zsh"

() {
skip_global_compinit=1
compaudit | xargs chmod g-w,o-w
}

# Source the ZSH RC files 
[[ -d "$ZDOTDIR" ]] && for i in "$ZDOTDIR"/rc/*.zsh; do . "$i"; done

export ZINIT_HOME="$HOME/.local/share/zinit"

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
# Oh My Zsh plugins
# ------------------------------------------------------------------------------

zinit default-ice -cq \
wait"0" \
lucid

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
zinit for                      \
OMZ::plugins/aws               \
OMZ::plugins/colored-man-pages \
OMZ::plugins/colorize          \
OMZ::plugins/common-aliases    \
OMZ::plugins/composer          \
OMZ::plugins/copyfile          \
OMZ::plugins/copypath          \
OMZ::plugins/cp                \
OMZ::plugins/extract           \
OMZ::plugins/fancy-ctrl-z      \
OMZ::plugins/git               \
OMZ::plugins/github            \
OMZ::plugins/gitignore         \
OMZ::plugins/nvm               \
OMZ::plugins/pip               \
OMZ::plugins/sudo              \
OMZ::plugins/ssh-agent         \
OMZ::plugins/urltools          \
OMZ::plugins/tmux              \
OMZ::plugins/vscode            \
OMZ::plugins/web-search        \
atload"hook l.magic-enter.zsh" \
OMZ::plugins/magic-enter



# ls_colors ~ A collection of LS_COLORS definitions
zi pack for ls_colors

# dircolors-material ~ A dircolors theme inspired by Material Design
zi pack for dircolors-material

# Warhol ~ A Zsh plugin for syntax highlighting
zi for unixorn/warhol.plugin.zsh

# lsd ~ The next gen ls command
zi for \
  from"gh-r" \
  as"program" \
  bpick"lsd-*" \
  pick"lsd-*/lsd" \
  atload"hook lsd.atload.zsh" \
@lsd-rs/lsd

# Vim ~ The one-in-only
zinit for \
  as"program" \
  atclone"
    rm -f src/auto/config.cache; \
    ./configure --prefix=$ZPFX
  " \
  atpull"%atclone" \
  make"all install" \
  pick"$ZPFX/bin/vim"
vim/vim

# Neovim ~ The next gen Vim
zi for \
  from'gh-r' \
  sbin'**/nvim -> nvim' \
  ver'nightly' \
neovim/neovim

# zsh-fnm ~ Fast node manager for Zsh
zinit for "dominik-schwabe/zsh-fnm"


# Code Helpers ~ Linters, LSPs, etc. 

## zsh 
zi for zdharma-continuum/{zsh-lint,zsh-sweep}

# shell
zi for \
  from'gh-r' \
  sbin'**/sh* -> shfmt' \
@mvdan/sh

# ZDharma Maintained Plugins
zi for \
  atinit'hook history-search-multi-word.atinit.zsh' \
zdharma-continuum/history-search-multi-word \
  atload'hook zsh-startify.atload.zsh' \
zdharma-continuum/zsh-startify \
zdharma-continuum/zzcomplete \
zdharma-continuum/git-url \
NICHOLAS85/z-a-linkbin \
NICHOLAS85/z-a-eval

# zsh-safe-rm ~ prevent the accidental deletion of important files
zi for \
mattmc3/zsh-safe-rm

# Zsh-Autopair ~ Auto-pairing quotes, brackets, etc in command line
zi for \
  nocompletions \
  compile"*.zsh" \
  atload"hook zsh-autopair.atload.zsh" \
  atinit"hook zsh-autopair.atinit.zsh" \
hlissner/zsh-autopair

# Auto installs the iTerm2 shell integration for Zsh
zi for \
  pick"shell_integration/zsh" \
  sbin"utilities/*" \
gnachman/iTerm2-shell-integration

# git-fuzzy ~ A CLI interface to git that relies on fzf
zi for \
  as"program" \
  pick"bin/git-fuzzy" \
bigH/git-fuzzy

# Neofetch ~ A command-line system information tool
zinit make for @dylanaraps/neofetch

# -----------------------------------------------------------------------------
zi default-ice -cq \
  from"gh-r" \
  wait"1" \
  lucid \
light-mode
# ------------------------------------------------------------------------------

# lazygit ~ A simple terminal UI for git commands
zi for \
  sbin'**/lazygit' \
jesseduffield/lazygit

# github-Copilot ~ A CLI for GitHub Copilot
zinit ice wait lucid
zinit snippet https://gist.githubusercontent.com/iloveitaly/a79ffc31ef5b4785da8950055763bf52/raw/4140dd8fa63011cdd30814f2fbfc5b52c2052245/github-copilot-cli.zsh

# tealdeer ~ A very fast implementation of tldr in Rust
zi for \
  dl"https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer -> _tealdeer" \
  sbin"tealdeer-* -> tldr" \
@dbrgn/tealdeer

# eza ~ A simple and fast Zsh plugin manager
zinit for \
  atclone'./eza.atclone.zsh' \
  atpull'%atclone' \
  atload"hook eza.atload.zsh" \
  pick'eza.zsh' \
  dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza" \
eza-community/eza

#atload"hook eza.atload.zsh" \A
# zi for \
# sbin"eza -> eza" \
# atload"hook eza.atload.zsh" \
# dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza" \
# eza-community/eza

# delta ~ A viewer for git and diff output
zi for \
  sbin'**/delta -> delta' \
dandavison/delta

# glow ~ A markdown reader for the terminal
zi for \
  sbin'glow_* -> glow' \
charmbracelet/glow

# zoxide ~ A smarter cd command
zi for \
  atload"hook zoxide.atload.zsh" \
  sbin"zoxide -> zoxide" \
@ajeetdsouza/zoxide

# -----------------------------------------------------------------------------
zi default-ice -cq \
  wait"1" \
  lucid \
light-mode
# ------------------------------------------------------------------------------

# diff-so-fancy ~ Make git diff output more readable
zi for \
  sbin"bin/git-dsf -> git-dsf" \
zdharma-continuum/zsh-diff-so-fancy

# history-search-multi-word ~ Make git history search
zinit for \
  wait"1" \
  atinit"
    zstyle ':history-search-multi-word' page-size '11'
  " \
zdharma-continuum/history-search-multi-word


# zeno ~ A simple and powerful Zsh prompt
zi for \
  atload"source ${CONFIGS}/zeno/zeno" \
  blockf \
  depth"1" \
  sbin"bin/zeno -> zeno" \
yuki-yano/zeno.zsh

# yank ~ Yank terminal output to clipboard
zi for \
  make \
  sbin"yank.1 -> yank" \
@mptre/yank

# tmux ~ Tmux terminal multiplexer
zi for \
  configure'--disable-utf8proc' \
  make \
@tmux/tmux

# fzf-preview ~ adds a popup window via tmux within standard shell mode
zi for \
  atload"hook fzf-preview.atload.zsh" \
  blockf \
  depth"1" \
@yuki-yano/fzf-preview.zsh 

# Zsh-fzf-utils ~ A collection of utilities for fzf and Zsh
zi for \
redxtech/zsh-fzf-utils

# ~- 2 -------------------------------------------------------------------------
zi default-ice -cq \
  wait"2" \
  lucid \
light-mode
# ------------------------------------------------------------------------------

# fzf-tab ~ A powerful completion engine for Zsh that uses fzf
zi for \
  atload"hook fzf-tab.atload.zsh" \
@Aloxaf/fzf-tab

# make sure you execute this *after* asdf or other version managers are loaded
if (( $+commands[github-copilot-cli] )); then
eval "$(github-copilot-cli alias -- "$0")"
fi

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "${CONFIGS}/.p10k.zsh" ]] || source "${CONFIGS}/.p10k.zsh"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/configs/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/configs/zsh/.p10k.zsh ]] || source ~/.dotfiles/configs/zsh/.p10k.zsh
