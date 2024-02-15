#!/usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab
# vim:set num clipboard+=unnamedplus foldmethsofttabstop=0

# Fix for Ubuntu, but might impprove performance on other systems
export skip_global_compinit="1"

# =============================================================================
# PRELOAD: ZINIT Installation and p10k Instant Prompt check
# =============================================================================

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Check if p10k instant prompt is installed, if so, source it
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# ZSH Config Files
# =============================================================================

source ${ZDOTDIR}/.zsh_aliases   # Aliases
source ${ZDOTDIR}/.zsh_functions # Easyloaded and Autoloaded Functions
source ${ZDOTDIR}/.zsh_hooks     # At{Init,Pull,Clone,Load} plugin hooks
source ${ZDOTDIR}/.zsh_autoloads # Autoloaded Zsh Modules
source ${ZDOTDIR}/.zsh_modules   # Loaded ZSHBuiltin Module

# =============================================================================
# THEME: powerlevel10k
# ========================================================= ====================
zinit for \
depth="1" \
romkatv/powerlevel10k

# =============================================================================
# ZSH Extensions
# =============================================================================

zinit \
light-mode \
depth"1" \
for \
zdharma-continuum/zinit-annex-bin-gem-node \
zdharma-continuum/zinit-annex-patch-dl \
zdharma-continuum/zinit-annex-default-ice \
zdharma-continuum/zinit-annex-readurl \
zdharma-continuum/zinit-annex-rust \
zdharma-continuum/zinit-annex-verbose \
zdharma-continuum/zinit-annex-binary-symlink

# =============================================================================
# PLUGINS: Oh My Zsh
# =============================================================================

zinit default-ice clear

# Libaries
zinit for \
    OMZL::correction.zsh \
    OMZL::directories.zsh \
    OMZL::functions.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::termsupport.zsh \
    OMZL::compfix.zsh \
    OMZL::git.zsh \
    OMZL::theme-and-appearance.zsh

# Plugins
zinit for \
    OMZP::aws.zsh \
    OMZP::colored-man-pages.zsh \
    OMZP::cp.zsh \
    OMZP::extract.zsh \
    OMZP::fancy-ctrl-z.zsh \
    OMZP::composer.zsh \
    OMZP::git.zsh \
    OMZP::gitignore.zsh \
    OMZP::github.zsh \
    OMZP::sudo.zsh \
    OMZP::urltools.zsh \
    OMZP::common-aliase.zsh \
    OMZP::copypath.zsh \
    OMZP::copyfile.zsh \
    OMZP::colorize.zsh \
    atload'
      source "${D[ATLOAD]}/magic-enter.zsh"
    ' \
    OMZP::magic-enterzsh

# =============================================================================
# PLUGINS: Bins
# =============================================================================

zinit default-ice \
ice \
from"gh-r" \
as"command"

# direnv ~ Unclutter your .zshrc
zinit for \
mv"direnv* -> direnv" \
atclone'./direnv hook zsh > zhook.zsh' \
atpull'%atclone' \
pick"direnv"
src="zhook.zsh" \
direnv/direnv

# exa ~ A modern replacement for ls
zinit for \
mv"bin/exa* -> exa" \
atpull"%atclone" \
atclone"source ${DOTFILES[ATLOAD]}/exa" \
atload"source ${DOTFILES[ATLOAD]}/exa" \
ogham/exa

# bat ~ A cat clone with wings
zinit for \
mv"bat-*/bat -> bat" \
atpull"%atclone" \
atclone"source ${DOTFILES[ATCLONE]}/bat" \
atload"source ${DOTFILES[ATLOAD]}//bat" \
sharkdp/bat

# delta ~ a viewer for git and diff output
zinit for \
mv"delta-*/delta -> delta" \
dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
atload"
  export DELTA_PAGER='less -R -F -+X --mouse'
" \
dandavison/delta

# grab fd binary
# TODO: preview commands are an absolute sh*tshow, maybe use .lessfilter?
# https://github.com/Aloxaf/fzf-tab/wiki/Preview#show-file-contents
# shellcheck disable=SC2016
zinit for \
mv"fd-*/fd -> fd" \
atpull"%atclone" \
atclone"hook atclone fd.zsh" \
atload"hook atload fd.zsh" \
sharkdp/fd

# FZF ~ A command-line fuzzy finder
zinit for \
dl"https://github.com/junegunn/fzf/raw/HEAD/shell/key-bindings.zsh -> key-bindings.zsh" \
dl"https://github.com/junegunn/fzf/raw/HEAD/shell/completion.zsh -> _fzf" \
dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf.1 -> ${ZINIT[MAN_DIR]}/man1/fzf.1" \
dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf-tmux.1 -> ${ZINIT[MAN_DIR]}/man1/fzf-tmux.1" \
src"key-bindings.zsh" \
junegunn/fzf

# grab vivid binary (for all the colors)
# shellcheck disable=SC2016
zinit for \
mv"vivid-*/vivid -> vivid" \
atload'export LS_COLORS="$(vivid generate snazzy)" ' \
sharkdp/vivid

# =============================================================================
# Completions
# =============================================================================

zi default-ice \
wait \
lucid

zinit for \
id-as"zsh-fancy-completions" \
z-shell/zsh-fancy-completions

zinit light-mode for \
    changyuheng/fz \
    chitoku-k/fzf-zsh-completions \
    djui/alias-tips \
    eastokes/aws-plugin-zsh                          \
    FFKL/s3cmd-zsh-plugin                            \
    greymd/docker-zsh-completion                     \
    hlissner/zsh-autopair                            \
    joshskidmore/zsh-fzf-history-search              \
    kutsan/zsh-system-clipboard                      \
    macunha1/zsh-terraform                           \
    nojanath/ansible-zsh-completion                  \
    nviennot/zsh-vim-plugin			                     \
    paw-lu/pip-fzf                                   \
    pierpo/fzf-docker                                \
    rapgenic/zsh-git-complete-urls                   \
    rupa/v                                           \
    skywind3000/z.lua                                \
    sparsick/ansible-zsh                             \
    srijanshetty/zsh-pip-completion                  \
    unixorn/docker-helpers.zshplugin                 \
    vasyharan/zsh-brew-services

# =============================================================================
# Zinit Commons
# =============================================================================
zinit for \
atload'
  source "$D[ATLOADS]"/fastsyntaxhighlighting.zsh
' \
id-as'fast-syntax-highlighting' \
  @zdharma-continuum/fast-syntax-highlighting \
atinit'
  source "$D[ATINIT]"/autosuggestions.zsh
' \
atload'
  source "$D[ATLOADS]"/autosuggestions.zsh
' \
id-as'zsh-autosuggestions' \
  @zsh-users/zsh-autosuggestions \
blockf \
atpull'source $D[ATPULL]/completions.zsh' \
id-as'zsh-completions' \
  @zsh-users/zsh-completions \
atload'source "$D[ATLOADS]"/hss.zsh' \
id-as'zsh-history-substring-search' \
  @zsh-users/zsh-history-substring-search

# =============================================================================
# compinit + cdreplay
# =============================================================================

if [[ $ZINIT[ZCOMPDUMP_PATH](#qNmh-20) ]]; then
  compinit -C -d ${ZINIT[ZCOMPDUMP_PATH]:-${ZDOTDIR:-$HOME}/.zcompdump} "${(Q@)${(z@)ZINIT[COMPINIT_OPTS]}}"
else
  mkdir -p "$ZINIT[ZCOMPDUMP_PATH]:h"
  compinit -i -d ${ZINIT[ZCOMPDUMP_PATH]:-${ZDOTDIR:-$HOME}/.zcompdump} "${(Q@)${(z@)ZINIT[COMPINIT_OPTS]}}"
  touch "$ZINIT[ZCOMPDUMP_PATH]"
fi

## Enable completion and other things.
autoload -Uz compinit && compinit -d "${ZDOTDIR}/zcompdump"

zinit cdreplay
