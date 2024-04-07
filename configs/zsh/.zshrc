#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# Skip the creation of global compinit
export skip_global_compinit=1

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

# lsd ~ The next gen ls command
zi for \
from"gh-r" \
as"program" \
bpick"lsd-*" \
pick"lsd-*/lsd" \
atload"hook lsd.atload.zsh" \
@lsd-rs/lsd

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

# Zsh-Alias-matcher ~ A fast and powerful alias matcher for Zsh
zi for \
sbin"zsh-alias-matcher -> zsh-alias-matcher" \
decayofmind/zsh-fast-alias-tips

# iTerm2 integration ~ Shell integration for iTerm2
zi for \
if'[[ "$TERM_PROGRAM" = "iTerm.app" ]]' \
pick"shell_integration/zsh" \
sbin"utilities/*" \
gnachman/iTerm2-shell-integration

# git-fuzzy ~ A CLI interface to git that relies on fzf
zi for \
as"program" \
pick"bin/git-fuzzy" \
bigH/git-fuzzy

# ~- GhR - 1 ------------------------------------------------------------------
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

zinit ice wait lucid
zinit snippet https://gist.githubusercontent.com/iloveitaly/a79ffc31ef5b4785da8950055763bf52/raw/4140dd8fa63011cdd30814f2fbfc5b52c2052245/github-copilot-cli.zsh


# tealdeer ~ A very fast implementation of tldr in Rust
zi for \
dl"https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer -> _tealdeer" \
sbin"tealdeer-* -> tldr" \
@dbrgn/tealdeer

# eza ~ A simple and fast Zsh plugin manager
zi for \
as'program' \
sbin'**/eza* -> eza' \
atclone"hook " \
dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza" \
eza-community/eza

#atload"hook eza.atload.zsh" \
# zi for \
# sbin"eza -> eza" \
# atload"hook eza.atload.zsh" \
# dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza" \
# eza-community/eza


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

# ~- 1 -------------------------------------------------------------------------
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

# tmux and extensions
zi for \
  configure'--disable-utf8proc' \
  make \
@tmux/tmux \
  depth"1" \
  blockf \
  atload"hook fzf-preview.atload.zsh" \
@yuki-yano/fzf-preview.zsh




# ~- 2 -------------------------------------------------------------------------
zi default-ice -cq \
wait"2" \
lucid \
light-mode
# ------------------------------------------------------------------------------

# Completion Plugins
zi for \
RobSis/zsh-completion-generator \
chitoku-k/fzf-zsh-completions \
z-shell/zsh-fancy-completions \
  depth"1" \
  atpull"zinit cclear && zinit creinstall sainnhe/zsh-completions" \
  atload"autoload -Uz compinit && compinit -u" \
sainnhe/zsh-completions \
  nocd \
  depth"1" \
  atinit='ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true' \
3v1n0/zsh-bash-completions-fallback \
  blockf \
  ver"zinit-fixed" \
  as"completion" \
  nocompile \
  mv'git-completion.zsh -> _git' \
iloveitaly/git-completion

# make sure you execute this *after* asdf or other version managers are loaded
if (( $+commands[github-copilot-cli] )); then
eval "$(github-copilot-cli alias -- "$0")"
fi

#autoload -Uz compinit && compinit
[[ $(date +'%j') != $(date -r ${LOCAL_CACHE}/.zcompdump +'%j') ]] &&
compinit || compinit -C

zinit cdreplay -q

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "${CONFIGS}/.p10k.zsh" ]] || source "${CONFIGS}/.p10k.zsh"
