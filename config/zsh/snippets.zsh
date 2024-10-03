#!/usr/bin/env zsh

# =================================================================================================
# -- omz plugins and libraries --------------------------------------------------------------------
# =================================================================================================

zinit for                                                                                         \
  OMZL::completion.zsh                                                                            \
  OMZL::compfix.zsh                                                                                \
  OMZL::correction.zsh                                                                             \
  OMZL::history.zsh                                                                              \
  OMZL::theme-and-appearance.zsh                                                                   \
  OMZP::brew                                                                                      \
  OMZP::colorize                                                                                \
  OMZP::cp                                                                                      \
  OMZP::grc                                                                                     \
  OMZP::urltools                                                                                \
  atload'hook magic-enter.atload.zsh'                                                           \
  OMZP::magic-enter                                               
