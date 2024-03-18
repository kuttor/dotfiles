#! /usr/bin/env zsh
# -*- coding: utf-8 -*-
# vim:set filetype=zsh syntax=zsh
# vim:set ft=zsh ts=2 sw=2 sts=0

# Deprecating zshenv in favor for zprofile
[[ -f /etc/zshenv && -f /etc/zprofile ]] &&
  sudo mv /etc/zshenv /etc/zprofile

# Instant Prompt
[[ -r "${LOCAL_CACHE}/p10k-instant-prompt-${USER}.zsh" ]] &&
  source "${LOCAL_HOME}/p10k-instant-prompt-${USER}.zsh"

# Zinit Autoinstaller
[[ ! -f "${ZINIT_HOME}/zinit.zsh" ]] &&
  git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}
source "${ZINIT_HOME}/zinit.zsh"

# ------------------------------------------------------------------------------
# ~ Powerlevel10k

zinit for \
  lucid \
  light-mode \
  depth=1 \
  atload"hook p10k.atload" \
  @romkatv/powerlevel10k

# ------------------------------------------------------------------------------
# ~ ZSH Annexes ~

zinit light-mode lucid for \
  zdharma-continuum/zinit-annex-meta-plugins \
  zdharma-continuum/zinit-annex-default-ice \
  zdharma-continuum/zinit-annex-link-man \
  zdharma-continuum/zinit-annex-pull \
  zdharma-continuum/zinit-annex-man \
  id-as"annexes" \
  annexes \
  zsh-users+fast \
  ext-git

# ------------------------------------------------------------------------------
# ~ Zinit Plugins ~

zinit pack for ls_colors
zinit pack for dircolors-material

zinit for \
  zdharma-continuum/zzcomplete \
  zdharma-continuum/zsh-lint \
  zdharma-continuum/zsh-sweep \
  zdharma-continuum/git-url \
  zdharma-continuum/zui \
  NICHOLAS85/z-a-eval

# ------------------------------------------------------------------------------
# ~ FZF ~

# fzf
zinit for \
  pack"bgn-binary+keys" \
  atload"source ${CONFIGS}/fzf.zsh" \
  dl"https://github.com/junegunn/fzf/raw/master/shell/completion.zsh" \
  fzf

# fzf-tab
zinit for \
  blockf \
  atload"source ${CONFIGS}/fzf-tab.zsh" \
  Aloxaf/fzf-tab

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
  OMZ::lib/grep.zsh \
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
  OMZ::plugins/grc \
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
zinit default-ice -cq \
  as"completion" \
  wait"1" \
  lucid

zinit for \
  OMZ::plugins/terraform/_terraform \
  OMZ::plugins/fd/_fd \
  OMZ::plugins/ag/_ag \
  OMZ::plugins/pip/_pip

zinit for \
  atload"source ${CONFIGS}/eza.zsh" \
  https://github.com/eza-community/eza/blob/main/completions/zsh/_eza

# ------------------------------------------------------------------------------
# ~ Turbo GH-Release Programs Delayed Start ~

# Clearing and setting previous ICE defaults
zinit default-ice -cq \
  as"program" \
  from"gh-r" \
  wait"1" \
  lucid \
  light-mode

# tealdeer ~ A very fast implementation of tldr in Rust
zinit for \
  dl"https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer -> _tealdeer" \
  atpull"!git reset --hard" \
  mv"tealdeer-* -> tldr" \
  pick"tldr" \
  dbrgn/tealdeer

# eza ~ A simple and fast Zsh plugin manager
zinit for \
  mv"*eza -> eza" \
  pick"eza" \
  atload"hook eza.atload.zsh" \
  dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza" \
  @eza-community/eza

# zinit for \
# atload"source ${CONFIGS}/eza.zsh" \
# https://github.com/eza-community/eza/blob/main/completions/zsh/_eza

# fd ~ A simple, fast and user-friendly alternative to find
zinit for \
  mv"fd* -> fd" \
  pick"fd/fd" \
  atload"hook fd.atload.zsh" \
  atclone"hook fd.atclone.zsh" \
  @sharkdp/fd

# bat ~ A cat(1) clone with wings
zinit for \
  mv"bat* -> bat" \
  pick"bat/bat" \
  atload"hook bat.atload.zsh" \
  atclone"hook bat.atclone.zsh" \
  @sharkdp/bat

# delta ~ A viewer for git and diff output
zinit for \
  atload"export DELTA_PAGER='less -R -F -+X --mouse'" \
  dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
  mv"delta-*/delta -> delta" \
  @dandavison/delta

# zoxide ~ A smarter cd command
zinit for \
  atload"hook zoxide.atload.zsh" \
  mv"zoxide* -> zoxide" \
  @ajeetdsouza/zoxide

zinit for \
  decayofmind/zsh-fast-alias-tips

# ------------------------------------------------------------------------------
# ~ Turbo Programs with Delayed Start ~
zinit default-ice -cq \
  as"program" \
  wait"1" \
  lucid \
  light-mode

# diff-so-fancy ~ Make git diff output more readable
zinit for \
  pick"bin/git-dsf" \
  zdharma-continuum/zsh-diff-so-fancy

# zeno ~ A simple and powerful Zsh prompt
zinit for \
  depth"1" \
  blockf \
  atload"source ${CONFIGS}/zeno/zeno" \
  yuki-yano/zeno.zsh

# ~ yank ~
# zinit for \
# pick"yank" \
# make \
# @mptre/yank

# tmux ~ Terminal multiplexer
zinit for \
  configure'--disable-utf8proc' \
  make \
  @tmux/tmux

# ------------------------------------------------------------------------------
# ~ Shell Enhancements ~

# Clearing and setting previous ICE defaults
zinit default-ice -cq \
  wait"0" \
  lucid \
  light-mode

# Zsh-Safe-Rm ~ Prevents accidental deletion of files
zinit for \
  unixorn/warhol.plugin.zsh \
  @mattmc3/zsh-safe-rm

# Zsh-Autopair ~ Auto-pairing quotes, brackets, etc in command line
zinit for \
  compile"*.zsh" \
  nocompletions \
  atload"hook zsh-autopair.atload.zsh" \
  atinit"hook zsh-autopair.atinit.zsh" \
  hlissner/zsh-autopair

# iTerm2 integration ~ Shell integration for iTerm2
zinit for \
  if'[[ "$TERM_PROGRAM" = "iTerm.app" ]]' \
  pick"shell_integration/zsh" \
  sbin"utilities/*" \
  gnachman/iTerm2-shell-integration

# ------------------------------------------------------------------------------
# ~ Completions ~
#zinit default-ice -cq as"completions" wait"0"

# zinit for \
# atload"source ${CONFIGS}/eza.zsh" \
# https://github.com/eza-community/eza/blob/main/completions/zsh/_eza

zinit default-ice -cq wait"0" lucid light-mode
zinit for \
  chitoku-k/fzf-zsh-completions \
  z-shell/zsh-fancy-completions \
  depth=1 \
  atload"autoload -Uz compinit && compinit -u" \
  atpull"zinit cclear && zinit creinstall sainnhe/zsh-completions" \
  sainnhe/zsh-completions \
  nocd \
  depth=1 \
  atinit='ZSH_BASH_COMPLETIONS_FALLBACK_LAZYLOAD_DISABLE=true' \
  3v1n0/zsh-bash-completions-fallback

# ------------------------------------------------------------------------------
# # ~ Zinit Commons ~
# zinit default-ice -cq wait"0" lucid light-mode

# zinit for \
# atinit"hook fast-syntax-highlighting.atinit.zsh" \
# atload"hook fast-syntax-highlighting.atload.zsh" \
# @zdharma-continuum/fast-syntax-highlighting \
# atinit"hook zsh-autosuggestions.atinit.zsh" \
# atload"hook zsh-autosuggestions.atload.zsh" \
# @zsh-users/zsh-autosuggestions \
# blockf \
# atpull"hook zsh-completions.atpull.zsh" \
# @zsh-users/zsh-completions

# ------------------------------------------------------------------------------
# ~ compinit + cdreplay ~

#autoload -Uz compinit && compinit
[[ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]] &&
  compinit || compinit -C

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/configs/.p10k.zsh.
[[ ! -f ~/.dotfiles/configs/.p10k.zsh ]] || source ~/.dotfiles/configs/.p10k.zsh
