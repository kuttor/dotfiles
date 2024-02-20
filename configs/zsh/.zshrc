#!/usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab
# vim:set num clipboard+=unnamedplus foldmethsofttabstop=0'

# =============================================================================
# PreConfig
# =============================================================================

# Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Deprecating zshenv in favor for zprofile
[[ -f /etc/zshenv && -f /etc/zprofile ]] && sudo mv /etc/zshenv /etc/zprofile

# Zinit Autoinstaller
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  mkdir -p "${ZINIT_HOME}" && chmod g-rwX "${ZINIT_HOME}"
  git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}t
fi

function hook {
  source $HOME/.dotfiles/hooks/$1
}

# shellcheck source=/dev/null-
source "${ZINIT_HOME}/zinit.zsh"

# =============================================================================
# THEME: powerlevel10k
# =============================================================================
export ZSH_THEME="powerlevel10k/powerlevel10k"

zinit for \
  depth"1" \
  atload"hook l.p10k.zsh" \
  romkatv/powerlevel10k

# =============================================================================
# ZSH Extensions
# =============================================================================

zinit light-mode for \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-default-ice \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-readurl \
  zdharma-continuum/zinit-annex-submods \
  zdharma-continuum/zinit-annex-rust \
  zdharma-continuum/zinit-annex-man

# =============================================================================
# PKG-TYPE | ZSH Packages
# =============================================================================

zinit pack"bgn-binary+keys" for fzf
zinit pack"bgn" for fzy
zinit pack for ls_colors
zinit pack for @github-issues
zinit wait pack atload=+"zicompinit; zicdreplay" for system-completions

# =============================================================================
# PKG-TYPE | Oh My Zsh
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
zinit snippet OMZ::plugins/pip
zinit snippet OMZ::plugins/sudo
zinit snippet OMZ::plugins/ssh-agent
zinit snippet OMZ::plugins/urltools
zinit snippet OMZ::plugins/tmux
zinit snippet OMZ::plugins/vscode
zinit snippet OMZ::plugins/web-search

zinit for \
atload"hook l.magic-enter" \
OMZ::plugins/magic-enter

# -- Completion -
zinit default-ice -c wait"1" as"completion" lucid-
zinit for \
OMZ::plugins/terraform \
OMZ::plugins/fd/_fd \
OMZ::plugins/ag/_ag \
OMZ::plugins/pip/_pip

# =============================================================================
# PKG-TYPE |  GIT Enhancers
# =============================================================================
zinit default-ice -c wait"1" light-mode lucid-

# Zinc ~ Zinc is a Zsh INstallation Curator
zinit for \
nocompletions \
as"completion" \
compile"{zinc_functions/*,segments/*,zinc.zsh}" \
atload"!prompt_zinc_setup; prompt_zinc_precmd" \
robobenklein/zinc

# Forgit ~ A utility that makes git status more readable
zinit for \
  atload"zinc_optional_depenency_loaded" \
romkatv/gitstatus \
voronkovich/gitignore.plugin.zsh \
wfxr/forgit

# =============================================================================
# PKG-TYPE: Binaries
# =============================================================================
zinit default-ice -c wait"1" as"command" lucid

# direnv ~ Unclutter your .zshrc
zinit for \
mv"direnv* -> direnv" \
atclone"./direnv hook zsh > zhook.zsh" \
atpull'%atclone' \
pick"direnv" \
src="zhook.zsh" \
@direnv/direnv

# exa ~ A modern replacement for ls
zinit for \
mv"bin/exa* -> exa" \
atpull"%a tclone" \
atclone"hook c.exa" \
atload"hook l.exa" \
@ogham/exa

# bat ~ A cat clone with wings
zinit for \
mv"bat-*/bat -> bat" \
atpull"%atclone" \
atclone"hook c.bat" \
atload"hook l.bat" \
@sharkdp/bat

# delta ~ a viewer for git and diff output
zinit for \
mv"delta-*/delta -> delta" \
dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
atload"export DELTA_PAGER='less -R -F -+X --mouse'" \
@dandavison/delta

# grab fd binary
# shellcheck disable=SC2016
zinit for \
mv"fd-*/fd -> fd" \
atpull"%atclone" \
atclone"hook c.fd.zsh" \
atload"hook l.fd.zsh" \
@sharkdp/fd

# grab vivid binary (for all the colors)
# shellcheck disable=SC2016
zinit for \
as"command" \
mv"vivid-*/vivid -> vivid" \
atload'export LS_COLORS="$(vivid generate snazzy)"' \
@sharkdp/vivid

# grab zoxide binary
# shellcheck disable=SC201````6
zinit for \
as"command" \
mv"zoxide-*/zoxide -> zoxide" \
atpull"%atclone" \
atclone"hook c.zoxide" \
atload"hook l.zoxide" \
@ajeetdsouza/zoxide

# diff-so-fancy
zinit ice wait"2" lucid as"command" pick"bin/git-dsf"
zinit load zdharma-continuum/zsh-diff-so-fancy

# =============================================================================
# PKG-TYPE | Shell Enhancers
# ============================================================================
zinit default-ice -c wait"0" lucid

zinit for \
djui/alias-tips \
ianthehenry/zsh-autoquoter \
kutsan/zsh-system-clipboard \
mattmc3/zsh-safe-rm

# =============================================================================
# Completions
# =============================================================================

zinit default-ice -c wait"0" lucid light-mode
# -- xa
zinit for \
id-as"zsh-fancy-completions" \
z-shell/zsh-fancy-completions

 #     changyuheng/fz \
      #     chitoku-k/fzf-zsh-completions \
      #     djui/alias-tips \
      #     eastokes/aws-plugin-zsh                          \
      #     FFKL/s3cmd-zsh-plugin                            \
      #     greymd/docker-zsh-completion                     \
      #     hlissner/zsh-autçopair                            \
      #     joshskidmore/zsh-fzf-history-search              \
      #     kutsan/zsh-system-clipboard                      \
      #     macunha1/zsh-terraform                           \
      #     nojanath/ansible-zsh-completion                  \
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
  atinit'hook i.autosuggests.zsh' \
  atload'hook l.autosuggests.zsh' \
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
#   touch "$ZINIT[ZCOMPDUMP_PATH] "
# fi
# ## Enable completion and other things.
# autoload -Uz compinit && compinit -d "${ZDOTDIR}/zcompdump"
# zinit drepl
autoload -Uz compinit && compinit
[[ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]] \
&& compinit \
|| compinit -C

zinit cdreplay -q

# To customize prompt, run p10k configurex or edit ~/.dotfiles/configs/zsh/.p10k.zsh
# shellcheck source=/dev/null.
hook l.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/configs/.p10k.
[[ ! -f ~/.dotfiles/configs/.p10k ]] || source ~/.dotfiles/configs/.p10k
