#!/usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab
# vim:set num clipboard+=unnamedplus foldmethsofttabstop=0

# =============================================================================
#  STAGE: Verfiy Status & reinstall and reconfigure if needed
# =============================================================================

# Activate P10k
[[ -f "${CACHE}/p10k-instant-prompt-akuttor.zsh" ]] && source "${CACHE}/p10k-instant-prompt-akuttor.zsh"

# Deprecating zshenv in favor for zprofile
[[ -f /etc/zshenv && -f /etc/zprofile ]] && sudo mv /etc/zshenv /etc/zprofile

# Zinit Autoinstaller
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
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
#export ZSH_THEME="powerlevel10k/powerlevel10k"

#zinit id-as for \
#"powerlevel10k" \
#  depth"1" \
#  atload"hook l.p10k.zsh" \
#romkatv/powerlevel10k

zinit for \
depth=1 \
lucid \
nocd \
@romkatv/powerlevel10k

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
zinit pack for dircolors-material
zinit pack for ls_colors
zinit pack"bgn-binary+keys" for fzf
zinit pack"bgn" for fzy
#zinit wait pack atload=+"zicompinit; zicdreplay" for system-completions

# =============================================================================
# PKG-TYPE | Oh My Zsh
# =============================================================================
zinit default-ice -cq wait"0" lucid

# -- Libraries -
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
atload"hook l.magic-enter.zsh" \
OMZ::plugins/magic-enter

# -- Completion --
zinit default-ice -cq wait"1" as"completion" lucid
zinit for \
OMZ::plugins/terraform \
OMZ::plugins/fd/_fd \
OMZ::plugins/ag/_ag \
OMZ::plugins/pip/_pip

# =============================================================================
# PKG-TYPE: Binaries
# =============================================================================
zinit default-ice -cq wait"1" as"command" lucid


# # exa ~ a modern replacement for ls
# zinit id-as for \
# "exa" \
#   atclone"hook c.exa.zsh" \
#   atload"hook l.exa.zsh" \
#   atpull"%a tclone" \
#   mv"bin/exa* -> exa" \
# @ogham/exa

zinit for \
atclone"hook c.eza.zsh" \
atload"hook l.eza.zsh" \
sbin'**/eza -> eza' \
eza-community/eza

# bat ~ a cat clone with wings
zinit for \
atclone"hook c.bat.zsh" \
atload"hook l.bat.zsh" \
atpull"%atclone" \
mv"bat-*/bat -> bat" \
@sharkdp/bat

# delta ~ a viewer for git and diff output
zinit for \
atload"export DELTA_PAGER='less -R -F -+X --mouse'" \
dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
mv"delta-*/delta -> delta" \
@dandavison/delta

# grab fd binary
# shellcheck disable=SC2016
zinit for \
atclone"hook c.fd.zsh" \
atload"hook l.fd.zsh" \
atpull"%atclone" \
mv"fd-*/fd -> fd" \
@sharkdp/fd

# vivid
# shellcheck disable=SC2016
zinit for \
atload'export LS_COLORS="$(vivid generate snazzy)"' \
mv"vivid-*/vivid -> vivid" \
@sharkdp/vivid

# zoxide ~
zinit for \
atclone"hook c.zoxide.zsh" \
atload"hook l.zoxide.zsh" \
atpull"%atclone" \
mv"zoxide-*/zoxide -> zoxide" \
@ajeetdsouza/zoxide

# diff-so-fancy ~
zinit for \
pick"bin/git-dsf" \
@zdharma-continuum/zsh-diff-so-fancy

# yank ~
zinit for \
pick"yank" \
make \
@mptre/yank

# =============================================================================
# PKG-TYPE | Enhancements:  Zshell
# ============================================================================
zinit default-ice -cq wait"0" lucid light-mode

zinit for \
@djui/alias-tips \
@ianthehenry/zsh-autoquoter \
@kutsan/zsh-system-clipboard \
@mattmc3/zsh-safe-rm


# =============================================================================
# PKG-TYPE | Enhancememnts: Git
# =============================================================================
zinit default-ice -cq wait"1" light-mode lucid

zinit for \
@wfxr/forgit \
atload"!prompt_zinc_setup; prompt_zinc_precmd" \
compile"{zinc_functions/*,segments/*,zinc.zsh}" \
@robobenklein/zinc

# =============================================================================
# Completions
# =============================================================================
zinit default-ice -cq wait"0" lucid light-mode

zinit for @z-shell/zsh-fancy-completions

#     changyuheng/fz \
#     chitoku-k/fzf-zsh-completions
#      djui/alias-tips \
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
autoload -Uz compinit && compinit
[[ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]] \
&& compinit \
|| compinit -C

zinit cdreplay -q

# To customize prompt, run p10k configure or edit ~/.dotfiles/configs/.p10k.
# [[ ! -f ${DOTFILES[CONFIG]}/.p10k ]] || source ${DOTFILES[CONFIG]}/.p10k

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/configs/.p10k.
[[ ! -f ~/.dotfiles/configs/.p10k ]] || source ~/.dotfiles/configs/.p10k
