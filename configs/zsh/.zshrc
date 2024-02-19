# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/configs/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/bin/env zsh
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=4 sw=4 sts=0
# vim:set autoindent shiftround smarttab
# vim:set num clipboard+=unnamedplus foldmethsofttabstop=0'
# shellchecck source=null
chmod -R 755 ~/.local
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  mkdir -p "${ZINIT_HOME}" && chmod g-rwX "${ZINIT_HOME}"
  git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}t
fi

# shellcheck source=/dev/null-
source "${ZINIT_HOME}/zinit.zsh"

# shellcheck source=/dev/null
function hook {\
  source "${ZINIT_HOME}/zinit.zsh"
}

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

#depth"1"

zinit light-mode for \
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

# -- Improve Git  -
zinit default-ice -c wait"1" as"completion" lucid-
zinit for \
nocompletions \
compile"{zinc_functions/*,segments/*,zinc.zsh}" \
atload"!prompt_zinc_setup; prompt_zinc_precmd" \
robobenklein/zinc

# ZINC git info is already async, but if you want it
zinit for \
atload"zinc_optional_depenency_loaded" \
romkatv/gitstatus

zinit for voronkovich/gitignore.plugin.zsh

# =============================================================================
# PLUGINS: Bins
# =============================================================================

# direnv ~ Unclutter your .zshrc
zinit as"command" for \
mv"direnv* -> direnv" \
atclone"./direnv hook zsh > zhook.zsh" \
atpull'%atclone' \
pick"direnv" \
src="zhook.zsh" \
@direnv/direnv

# exa ~ A modern replacement for ls
zinit for \
as"command" \
mv"bin/exa* -> exa" \
atpull"%a tclone" \
atclone"hook c.exa" \
atload"hook l.exa" \
@ogham/exa

# bat ~ A cat clone with wings
zinit for \
as"command" \
mv"bat-*/bat -> bat" \
atpull"%atclone" \
atclone"hook c.bat" \
atload"hook l.bat" \
@sharkdp/bat

# delta ~ a viewer for git and diff output
zinit for \
as"command" \
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
as"command" \
@sharkdp/fd

# FZF ~ A command-line fuzzy finder
zinit for \
as"command" \
dl"https://github.com/junegunn/fzf/raw/HEAD/shell/key-bindings.zsh -> key-bindings.zsh" \
dl"https://github.com/junegunn/fzf/raw/HEAD/shell/completion.zsh -> _fzf" \
dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf.1 -> ${ZINIT[MAN_DIR]}/man1/fzf.1" \
dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf-tmux.1 -> ${ZINIT[MAN_DIR]}/man1/fzf-tmux.1" \
src "key-bindings.zsh" \
@junegunn/fzf

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
