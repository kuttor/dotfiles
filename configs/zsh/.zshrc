#!/usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab
# vim:set num clipboard+=unnamedplus foldmethsofttabstop=0
GITSTATUS_LOG_LEVEL=DEBUG

# =============================================================================
# PRELOAD: ZINIT Installation and p10k Instant Prompt check
# =============================================================================

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# shellcheck enableSourceErrorDiagnostics="0"
# Check if p10k instant prompt is installed, if so, source it

ZINIT_HOME="${XDG_DATA_HOME:-${HOME:-~/.local/share}}/zinit"
chmod -R 755 $HOME/.local/*
if [[ ! -f "${ZINIT_HOME}/zinit.git/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  mkdir -p "${ZINIT_HOME}" && chmod g-rwX "${ZINIT_HOME}"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}/zinit.git" &&
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.git/zinit.zsh"

# =============================================================================
hook() {
  source $DOTFILES[HOOKSCRIPTS]/${1}
}

# =============================================================================
# ZSH Config Files
# =============================================================================

#shellcheck source $HOME/.dotfiles/configs/zsh/.zsh_paths
source ${ZDOTDIR}/.zsh_paths     # Paths
source ${ZDOTDIR}/.zsh_options   # Options
source ${ZDOTDIR}/.zsh_autoloads # Autoloads
source ${ZDOTDIR}/.zsh_aliases   # Aliases
source ${ZDOTDIR}/.zsh_functions # {Easy,Auto}loaded Functions
#source ${ZDOTDIR}/.zsh_hooks    # At{Init,Pull,Clone,Load} plugin hooks
source ${ZDOTDIR}/.zsh_modules # ZSHBuiltin Module

# =============================================================================
# THEME: powerlevel10k
# ========================================================= ====================
ZSH_THEME="powerlevel10k/powerlevel10k"

zinit for \
  depth"1" \
  atload"hook l.p10k.zsh" \
  romkatv/powerlevel10k

# =============================================================================
# ZSH Extensions
# =============================================================================

zinit depth"1" for \
  zdharma-continuum/zinit-annex-default-ice \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-readurl \
  zdharma-continuum/zinit-annex-rust \
  zdharma-continuum/zinit-annex-submods \
  zinit-zsh/z-a-man

# =============================================================================
# PLUGINS: Oh My Zsh
# =============================================================================

zinit default-ice --clear

# -- Libraries --
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/compfix.zsh
zinit snippet OMZ::lib/correction.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/misc.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::lib/vcs_info.zsh

# -- Plugins --
zinit snippet OMZ::plugins/aws
zinit snippet OMZ::plugins/colored-man-pages
zinit snippet OMZ::plugins/colorize
zinit snippet OMZ::plugins/common-aliases
zinit snippet OMZ::plugins/composer
zinit snippet OMZ::plugins/copyfile
zinit snippet OMZ::plugins/copypath
zinit snippet OMZ::plugins/cp
zinit snippet OMZ::plugins/extract
zinit snippet OMZ::plugins/fancy-ctrl-z
zinit snippet OMZ::plugins/git
zinit snippet OMZ::plugins/github
zinit snippet OMZ::plugins/gitignore
zinit snippet OMZ::plugins/sudo
zinit snippet OMZ::plugins/urltools
zinit ice atload"hook l.magic-enter.zsh" lucid
zinit snippet OMZ::plugins/magic-enter

# -- Improve Git --
zinit wait'1' for \
nocompletion \
compile"{zinc_functions/*,segments/*,zinc.zsh}" \
atload"!prompt_zinc_setup; prompt_zinc_precmd" \
robobenklein/zinc

# ZINC git info is already async, but if you want it
# even faster with gitstatus in Turbo mode:
# https://github.com/romkatv/gitstatus
zinit ice wait'1' atload'zinc_optional_depenency_loaded'
zinit load romkatv/gitstatus

# -- Completions --
zinit ice wait'1' as"completion" lucid
zinit snippet OMZP::docker

zinit ice wait'1' as"completion" lucid
zinit snippet OMZ::plugins/terraform

# -- FD Completions --
zinit ice wait'1' as"completion" lucid
zinit snippet OMZ::plugins/fd/_fd

# -- AG Completion --
zinit ice wait'1' as"completion" lucid
zinit snippet OMZ::plugins/ag/_ag

#zinit ice as"completion"
#zinit snippet OMZ::plugins/pip/_pip

# =============================================================================
# PLUGINS: Bins
# =============================================================================
zinit default-ice --clear
zinit default-ice from"gh-r"

# direnv ~ Unclutter your .zshrc
zinit as"command" for \
  mv"direnv* -> direnv" \
  atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' \
  pick"direnv" \
  src="zhook.zsh" \
  @direnv/direnv

# exa ~ A modern replacement for ls
zinit as"command" for \
  mv"bin/exa* -> exa" \
  atpull"%atclone" \
  atclone"hook c.exa" \
  atload"hook l.exa" \
  @ogham/exa

# bat ~ A cat clone with wings
zinit as"command" for \
  mv"bat-*/bat -> bat" \
  atpull"%atclone" \
  atclone"hook c.bat" \
  atload"hook l.bat" \
  @sharkdp/bat

# delta ~ a viewer for git and diff output
zinit as"command" for \
  mv"delta-*/delta -> delta" \
  dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
  atload"export DELTA_PAGER='less -R -F -+X --mouse'" \
  @dandavison/delta

# grab fd binary
# shellcheck disable=SC2016
zinit as"command" for \
  mv"fd-*/fd -> fd" \
  atpull"%atclone" \
  atclone"hook c.fd.zsh" \
  atload"hook l.fd.zsh" \
  @sharkdp/fd

# FZF ~ A command-line fuzzy finder
zinit as"command" for \
  dl"https://github.com/junegunn/fzf/raw/HEAD/shell/key-bindings.zsh -> key-bindings.zsh" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/shell/completion.zsh -> _fzf" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf.1 -> ${ZINIT[MAN_DIR]}/man1/fzf.1" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf-tmux.1 -> ${ZINIT[MAN_DIR]}/man1/fzf-tmux.1" \
  src"key-bindings.zsh" \
  @junegunn/fzf

# grab vivid binary (for all the colors)
# shellcheck disable=SC2016
# zinit as"command" for \
#   mv"vivid-*/vivid -> vivid" \
#   atload'export LS_COLORS="$(vivid generate snazzy)"' \
#   @sharkdp/vivid

# zinit for \
#   as"command" \
#   from"gh-r" \
#   mv"fd* -> fd" \
#   pick"fd/fd" \
#   sharkdp/fd
# =============================================================================
# Completions
# =============================================================================

# zinit default-ice \
# wait \
# lucid

# zinit for \
#   id-as"zsh-fancy-completions" \
#   z-shell/zsh-fancy-completions
# zinit light-mode for \
#     changyuheng/fz \
#     chitoku-k/fzf-zsh-completions \
#     djui/alias-tips \
#     eastokes/aws-plugin-zsh                          \
#     FFKL/s3cmd-zsh-plugin                            \
#     greymd/docker-zsh-completion                     \
#     hlissner/zsh-autopair                            \
#     joshskidmore/zsh-fzf-history-search              \
#     kutsan/zsh-system-clipboard                      \
#     macunha1/zsh-terraform                           \
#     nojanath/ansible-zsh-completion                  \
#     nviennot/zsh-vim-plugin			                     \
#     paw-lu/pip-fzf                                   \
#     pierpo/fzf-docker                                \
#     rapgenic/zsh-git-complete-urls                   \
#     rupa/v                                           \
#     skywind3000/z.lua                                \
#     sparsick/ansible-zsh                             \
#     srijanshetty/zsh-pip-completion                  \
#     unixorn/docker-helpers.zshplugin                 \
#     vasyharan/zsh-brew-services                      \
#     mattmc3/zsh-safe-rm

# =============================================================================
# Zinit Commons
# =============================================================================

zinit for \
  id-as'fast-syntax-highlighting' \
  atload'hook l.fastsyntaxhighlighting.zsh' \
  @zdharma-continuum/fast-syntax-highlighting \
  id-as'zsh-autosuggestions' \
  atinit'hook i.zsh-autosuggestions.zsh' \
  atload'hook l.zsh-autosuggestions.zsh' \
  @zsh-users/zsh-autosuggestions \
  blockf \
  atpull'hook p.completions.zsh' \
  id-as'zsh-completions' \
  @zsh-users/zsh-completions \
  id-as'zsh-history-substring-search' \
  atload'hook l.hss.zsh' \
  @zsh-users/zsh-history-substring-search

# =============================================================================
# compinit + cdreplay
# =============================================================================

# if [[ $ZINIT[ZCOMPDUMP_PATH](#qNmh-20) ]]; then
#   compinit -C -d ${ZINIT[ZCOMPDUMP_PATH]:-${ZDOTDIR:-$HOME}/.zcompdump} "${(Q@)${(z@)ZINIT[COMPINIT_OPTS]}}"
# else
#   mkdir -p "$ZINIT[ZCOMPDUMP_PATH]:h"
#   compinit -i -d ${ZINIT[ZCOMPDUMP_PATH]:-${ZDOTDIR:-$HOME}/.zcompdump} "${(Q@)${(z@)ZINIT[COMPINIT_OPTS]}}"
#   touch "$ZINIT[ZCOMPDUMP_PATH]"
# fi

# ## Enable completion and other things.
# autoload -Uz compinit && compinit -d "${ZDOTDIR}/zcompdump"

# zinit cdrepla

if [ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]; then
  compinit
else
  compinit -C
fi

zinit cdreplay -q
