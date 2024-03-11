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

# -- Zinit-Packages ------------------------------------------------------------

# ~ fzf ~
zinit for \
pack"bgn-binary+keys" \
atload"source ${CONFIGS}/fzf.zsh" \
fzf

zinit pack for ls_colors
zinit pack for dircolors-material

zinit for \
zdharma-continuum/zzcomplete \
zdharma-continuum/zsh-lint \
zdharma-continuum/zsh-sweep \
zdharma-continuum/git-url \
zdharma-continuum/zui \
NICHOLAS85/z-a-eval \

# =============================================================================
# ~ Oh My Zsh ~

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
atload"hook magic-enter.atload.zsh" \
OMZ::plugins/magic-enter

# -- Completions --
zinit default-ice -cq as"completion" wait"1" lucid
zinit for \
OMZ::plugins/terraform/_terraform \
OMZ::plugins/fd/_fd \
OMZ::plugins/ag/_ag \
OMZ::plugins/pip/_pip

# ------------------------------------------------------------------------------
# ~ Delayed GH-Release Programs ~
zinit default-ice -cq \
as"program" \
from"gh-r" \
wait"1" \
lucid \
light-mode

# ~ eza ~
zinit for \
mv"*eza -> eza" \
pick"eza" \
atload"hook eza.atload.zsh" \
dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza" \
@eza-community/eza

# ~ fd ~
zinit for \
mv"fd* -> fd" \
pick"fd/fd" \
atload"hook fd.atload.zsh" \
atclone"hook fd.atclone.zsh" \
@sharkdp/fd

# ~ bat ~
zinit for \
mv"bat* -> bat" \
pick"bat/bat" \
atload"hook bat.atload.zsh" \
atclone"hook bat.atclone.zsh" \
@sharkdp/bat

# ~ delta ~
zinit for \
atload"export DELTA_PAGER='less -R -F -+X --mouse'" \
dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
mv"delta-*/delta -> delta" \
@dandavison/delta

# ~ zoxide ~
zinit for \
atload"hook zoxide.atload.zsh" \
mv"zoxide* -> zoxide" \
@ajeetdsouza/zoxide

# ------------------------------------------------------------------------------
# ~ Delayed Programs ~
zinit default-ice -cq \
as"program" \
wait"1" \
lucid \
light-mode

# ~ diff-so-fancy ~
zinit for \
pick"bin/git-dsf" \
zdharma-continuum/zsh-diff-so-fancy

# ~ zeno ~
zinit for \
depth"1" \
blockf \
atload"source ${CONFIGS}/zeno/zeno" \
yuki-yano/zeno.zsh

# # yank ~
# zinit for \
# pick"yank" \
# make \
# @mptre/yank

# ------------------------------------------------------------------------------
# ~ Shell Enhancements ~
zinit default-ice -cq \
wait"0" \
lucid \
light-mode

zinit for \
@djui/alias-tips \
@ianthehenry/zsh-autoquoter \
@kutsan/zsh-system-clipboard \
@mattmc3/zsh-safe-rm \
@psprint/zsh-navigation-tools \
chitoku-k/fzf-zsh-completions \
joshskidmore/zsh-fzf-history-search \
paw-lu/pip-fzf \
pierpo/fzf-docker 

# ~ iTerm2 integration ~
zinit for \
if'[[ "$TERM_PROGRAM" = "iTerm.app" ]]' \
pick"shell_integration/zsh" \
sbin"utilities/*" \
gnachman/iTerm2-shell-integration

# ~ fzf-tab ~
zinit for \
blockf \
atload"source ${CONFIGS}/fzf-tab.zsh" \
Aloxaf/fzf-tab

# ~ fzshell ~
zinit for \
atload"
  export FZSHELL_CONFIG=${CONFIGS};
  export FZSHELL_BIND_KEY='^x'
" \
mnowotnik/fzshell

# ------------------------------------------------------------------------------
# ~ Completions ~
#zinit default-ice -cq as"completions" wait"0"

# zinit for \
# atload"source ${CONFIGS}/eza.zsh" \
# https://github.com/eza-community/eza/blob/main/completions/zsh/_eza


zinit default-ice -cq wait"0" lucid light-mode
zinit for \
z-shell/zsh-fancy-completions \
depth=1 \
atload"
  autoload -Uz compinit;
  compinit -u
" \
atpull"
  zinit cclear;
  zinit creinstall sainnhe/zsh-completions
" \
sainnhe/zsh-completions \
nocd \
depth=1 \
atinit='ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true' \
3v1n0/zsh-bash-completions-fallback \
chitoku-k/fzf-zsh-completions \
rapgenic/zsh-git-complete-urls \
nojanath/ansible-zsh-completion \
srijanshetty/zsh-pip-completion


#     changyuheng/fz \
#     eastokes/aws-plugin-zsh                          \
#     FFKL/s3cmd-zsh-plugin                            \
#     macunha1/zsh-terraform                           \
#     rupa/v                                           \
#     sparsick/ansible-zsh                             \
#     unixorn/docker-helpers.zshplugin                 \
#     vasyharan/zsh-brew-services

# ------------------------------------------------------------------------------
# ~ Zinit Commons ~
zinit default-ice -cq wait"0" lucid light-mode

zinit for \
atinit"hook fast-syntax-highlighting.atinit.zsh" \
atload"hook fast-syntax-highlighting.atload.zsh" \
@zdharma-continuum/fast-syntax-highlighting \
atinit"hook zsh-autosuggestions.atinit.zsh" \
atload"hook zsh-autosuggestions.atload.zsh" \
@zsh-users/zsh-autosuggestions \
blockf \
atpull"hook zsh-completions.atpull.zsh" \
@zsh-users/zsh-completions

# ------------------------------------------------------------------------------
# ~ compinit + cdreplay ~

#autoload -Uz compinit && compinit
[[ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]] \
&& compinit || compinit -C

zinit cdreplay -q