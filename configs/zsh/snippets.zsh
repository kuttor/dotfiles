#!/usr/bin/env zsh
#vim:set filetype=zsh ts=2:sw=2:sts=2

# ==============================================================================
# -- omz plugins and libraries -------------------------------------------------
# ==============================================================================

zinit for \
  OMZL::completion.zsh \
  OMZL::compfix.zsh \
  OMZL::correction.zsh \
  OMZL::directories.zsh \
  OMZL::functions.zsh \
  OMZL::git.zsh \
  OMZL::history.zsh \
  OMZL::misc.zsh \
  OMZL::termsupport.zsh \
  OMZL::theme-and-appearance.zsh \
  OMZL::vcs_info.zsh \
  OMZP::aliases \
  OMZP::ansible \
  OMZP::aws \
  OMZP::brew \
  OMZP::bgnotify \
  OMZP::colored-man-pages \
  OMZP::colorize \
  OMZP::common-aliases \
  OMZP::composer \
  OMZP::copybuffer \
  OMZP::copyfile \
  OMZP::copypath \
  OMZP::cp \
  OMZP::extract \
  OMZP::fancy-ctrl-z \
  OMZP::git \
  OMZP::git-extras \
  OMZP::github \
  OMZP::grc \
  OMZP::iterm2 \
  OMZP::last-working-dir \
  OMZP::nvm \
  OMZP::npm \
  OMZP::pip \
  OMZP::sudo \
  OMZP::ssh-agent \
  OMZP::urltools \
  OMZP::tmux \
  OMZP::vscode \
  OMZP::web-search \
  atload"hook magic-enter.atload.zsh" \
  OMZP::magic-t
