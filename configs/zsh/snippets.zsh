#!/usr/bin/env zsh
#vim:set filetype=zsh ts=2:sw=2:sts=2

# ==============================================================================
# -- omz plugins and libraries -------------------------------------------------
# ==============================================================================

zinit for \
  OMZL::completion.zsh \
  OMZL::compfix.zsh \
  OMZL::correction.zsh \
  OMZL::history.zsh \
  OMZL::termsupport.zsh \
  OMZL::theme-and-appearance.zsh \
  OMZP::brew \
  OMZP::colorize \
  OMZP::cp \
  OMZP::grc \
  OMZP::urltools \
  atload"hook magic-enter.atload.zsh" \
  OMZP::magic-enter
