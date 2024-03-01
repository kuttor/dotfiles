#!/usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=4 sw=4 sts=0

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
#  STAGE: Verfiy Status & reinstall and reconfigure if needed
# =============================================================================
#ZSH_THEME="powerlevel10k/powerlevel10k"
#[[ ! -f ${DOTFILES[CONFIG]}/.p10k.zsh ]] || source ${DOTFILES[CONFIG]}/.p10k.zsh
# Deprecating zshenv in favor for zprofile
[[ -f /etc/zshenv && -f /etc/zprofile ]] && sudo mv /etc/zshenv /etc/zprofile

# Zinit Autoinstaller
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}
fi
# shellcheck source=/dev/null
source "${ZINIT_HOME}/zinit.zsh"

# =============================================================================
# THEME: powerlevel10k
# =============================================================================

zinit for \
lucid \
light-mode \
depth=1 \
@romkatv/powerlevel10k

[[ ! -f ${CONFIGS}/.p10k.zsh ]] || source ${CONFIGS}/.p10k.zsh

# =============================================================================
# ZSH Annexes Extensions
# =============================================================================

zinit light-mode lucid for \
zdharma-continuum/zinit-annex-bin-gem-node \
zdharma-continuum/zinit-annex-default-ice \
zdharma-continuum/zinit-annex-patch-dl \
zdharma-continuum/zinit-annex-readurl \
zdharma-continuum/zinit-annex-submods \
zdharma-continuum/zinit-annex-rust \
zdharma-continuum/zinit-annex-pull \
zdharma-continuum/zinit-annex-man
# id-as"annexes" \
# zdharma-continuum/zinit-annex-meta-plugins

# zinit default-ice -cq light-mode lucid
# zinit for \
# annexes \
# zsh-users+fast \
# ext-git \
# @sharkdp

# =============================================================================
# PKG-TYPE | ZSH Packages
# =============================================================================
zinit default-ice -cq
zinit pack"bgn-binary+keys" for fzf
zinit pack"bgn"             for fzy
zinit pack                  for ls_colors

zinit for \
zdharma-continuum/zzcomplete \
zdharma-continuum/zsh-lint \
zdharma-continuum/zsh-sweep \
zdharma-continuum/git-url
#zdharma-continuum/zui \
#NICHOLAS85/z-a-eval

# =============================================================================
# PKG-TYPE | Oh My Zsh
# =============================================================================

# -- Libraries --
zinit default-ice -cq wait"0" lucid
zinit for \
OMZ::lib/completion.zsh \
OMZ::lib/compfix.zsh \
OMZ::lib/correction.zsh \
OMZ::lib/directories.zsh \
OMZ::lib/functions.zsh \
OMZ::lib/git.zsh \
OMZ::lib/history.zsh \
OMZ::lib/misc.zsh \
OMZ::lib/termsupport.zsh \
OMZ::lib/theme-and-appearance.zsh \
OMZ::lib/vcs_info.zsh

# -- Plugins --
zinit for \
OMZ::plugins/aws \
OMZ::plugins/colored-man-pages \
OMZ::plugins/colorize \
OMZ::plugins/common-aliases \
OMZ::plugins/composer \
OMZ::plugins/copyfile \
OMZ::plugins/copypath \
OMZ::plugins/cp \
OMZ::plugins/extract \
OMZ::plugins/fancy-ctrl-z \
OMZ::plugins/git \
OMZ::plugins/github \
OMZ::plugins/gitignore \
OMZ::plugins/pip \
OMZ::plugins/sudo \
OMZ::plugins/ssh-agent \
OMZ::plugins/urltools \
OMZ::plugins/tmux \
OMZ::plugins/vscode \
OMZ::plugins/web-search \
atload"hook l.magic-enter.zsh" \
OMZ::plugins/magic-enter

# -- Completions --
zinit default-ice -cq as"completion" wait"1" lucid
zinit for \
OMZ::plugins/terraform \
OMZ::plugins/fd/_fd \
OMZ::plugins/ag/_ag \
OMZ::plugins/pip/_pip

# =============================================================================
# PKG-TYPE: Binaries
# =============================================================================
zinit default-ice -cq as"program" wait"1" lucid light-mode

# -- Eza --
# zinit for \
# #atclone"hook c.eza.zsh" \
# #atload"hook l.eza.zsh" \
# sbin'**/eza -> eza' \
# eza-community/eza

# sharkdp/fd
zinit for \
from"gh-r" \
mv"fd* -> fd" \
pick"fd/fd" \
@sharkdp/fd

# sharkdp/bat
zinit for \
from"gh-r" \
mv"bat* -> bat" \
pick"bat/bat" \
@sharkdp/bat

# delta ~ a viewer for git and diff output
zinit for \
atload"export DELTA_PAGER='less -R -F -+X --mouse'" \
dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
mv"delta-*/delta -> delta" \
@dandavison/delta

# zoxide ~  a simple, fast and user-friendly alternative to cd
zinit for \
atclone"hook c.zoxide.zsh" \
atload"hook l.zoxide.zsh" \
atpull"%atclone" \
mv"zoxide-*/zoxide -> zoxide" \
@ajeetdsouza/zoxide

# # diff-so-fancy ~
# zinit for \
# pick"bin/git-dsf" \
# @zdharma-continuum/zsh-diff-so-fancy

# # yank ~
# zinit for \
# pick"yank" \
# make \
# @mptre/yank

# # dbrgn/tealdeer
# zinit for \
# wait"2" \
# as"command" \
# from"gh-r" \
# mv"tldr* -> tldr" \
# atclone"./tldr --update" atpull"%atclone" \
# eval'echo "complete -W \"$(./tldr 2>/dev/null --list)\" tldr"' \
# @dbrgn/tealdeer

# =============================================================================
# PKG-TYPE | Shell Enhancements
# ============================================================================
zinit default-ice -cq wait"0" lucid light-mode
zinit for \
@djui/alias-tips \
@ianthehenry/zsh-autoquoter \
@kutsan/zsh-system-clipboard \
@mattmc3/zsh-safe-rm \
@psprint/zsh-navigation-tools \
chitoku-k/fzf-zsh-completions \
joshskidmore/zsh-fzf-history-search

zinit for \
blockf \
atload"source ${CONFIGS}/fzf-tab.zsh" \
Aloxaf/fzf-tab

zinit for \
atload"export FZSHELL_CONFIG=${CONFIGS}; export FZSHELL_BIND_KEY='^x'" \
mnowotnik/fzshell

# =============================================================================
# Completions
# =============================================================================
zinit default-ice -cq as"completions" wait"0"
zinit for \
atload"source ${CONFIGS}/eza.zsh" \
https://github.com/eza-community/eza/blob/main/completions/zsh/_eza


zinit default-ice -cq wait"0" lucid light-mode
zinit for \
z-shell/zsh-fancy-completions \
depth=1 \
atload"autoload -Uz compinit; compinit -u" \
atpull"zinit cclear; zinit creinstall sainnhe/zsh-completions" \
sainnhe/zsh-completions \
nocd \
depth=1 \
atinit='ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true' \
3v1n0/zsh-bash-completions-fallback


#     changyuheng/fz \
#     chitoku-k/fzf-zsh-completions
#     eastokes/aws-plugin-zsh                          \
#     FFKL/s3cmd-zsh-plugin                            \
#     greymd/docker-zsh-completion                     \
#     joshskidmore/zsh-fzf-history-search              \
#     kutsan/zsh-system-clipboard                      \
#     macunha1/zsh-terraform                           \
#     nojanath/ansible-zsh-completion                  \
#     paw-lu/pip-fzf                                   \
#     pierpo/fzf-docker                                \
#     rapgenic/zsh-git-complete-urls                   \
#     rupa/v                                           \
#     sparsick/ansible-zsh                             \
#     srijanshetty/zsh-pip-completion                  \
#     unixorn/docker-helpers.zshplugin                 \
#     vasyharan/zsh-brew-services

# =============================================================================
# Zinit Commons
# =============================================================================
zinit default-ice -cq wait"0" lucid light-mode

zinit for \
atinit"hook i.fastsyntaxhighlighting.zsh" \
atload"hook l.fastsyntaxhighlighting.zsh" \
@zdharma-continuum/fast-syntax-highlighting \
atinit"hook i.autosuggests.zsh" \
@zsh-users/zsh-autosuggestions \
blockf \
atpull"hook p.completions.zsh" \
@zsh-users/zsh-completions

# =============================================================================
# compinit + cdreplay
# =============================================================================
#autoload -Uz compinit && compinit
[[ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]] \
&& compinit \
|| compinit -C

zinit cdreplay -q

# To customize prompt, run p10k configure or edit ~/.dotfiles/configs/.p10k.
#[[ ! -f ${DOTFILES[CONFIGS]}/.p10.zsh ]] || source ${DOTFILES[CONFIGS]}/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/configs/zsh/.p10k.zsh.
#[[ ! -f ~/.dotfiles/configs/zsh/.p10k.zsh ]] || source ~/.dotfiles/configs/zsh/.p10k.zsh
