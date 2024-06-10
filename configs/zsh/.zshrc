# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/configs/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/bin/env zsh
#-*- mode: shell-script -*-
#vim: ft=zsh st=zsh sw=2 ts=2 sts=0

# --- powerlevel10k instant prompt ---
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]&&\
    . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# --- zinit load ---
local ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && \
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Start profiler
ZSH_PROFILE=1
[[ "${ZSH_PROFILE}" == 1 ]] && zmodload zsh/zprof || ZSH_PROFILE=0

# ==============================================================================
# -- zinit annexes -------------------------------------------------------------
# ==============================================================================
zinit for                                                                      \
zdharma-continuum/zinit-annex-binary-symlink                                   \
zdharma-continuum/zinit-annex-meta-plugins                                     \
zdharma-continuum/zinit-annex-default-ice                                      \
zdharma-continuum/zinit-annex-as-monitor                                       \
zdharma-continuum/zinit-annex-link-man                                         \
zdharma-continuum/zinit-annex-pull                                             \
zdharma-continuum/zinit-annex-man                                              \
annexes                                                                        \
zsh-users+fast                                                                 \
console-tools                                                                  \
zdharma2                                                                       \
zdharma                                                                        \
ext-git

#zinit for                                                                             \
#NICHOLAS85/z-a-linkbin                                                                \
#NICHOLAS85/z-a-eval

zinit default-ice -cq wait"0" lucid light-mode

# ==============================================================================
# -- zsh configs ---------------------------------------------------------------
# ==============================================================================
zinit snippet "${ZDOTDIR}/paths.zsh"
zinit snippet "${ZDOTDIR}/options.zsh"
zinit snippet "${ZDOTDIR}/modules.zsh"
zinit snippet "${ZDOTDIR}/aliases.zsh"
zinit snippet "${ZDOTDIR}/history.zsh"
zinit snippet "${ZDOTDIR}/keybind.zsh"

# ==============================================================================
# -- 1st loaded ----------------------------------------------------------------
# ==============================================================================

# zman ~ adds completion for loading zman pages
zinit for mattmc3/zman

# p10k ~ a powerful theme for zsh
zinit for                                                                      \
      atload"POWERLEVEL10K_CONFIG_FILE='${DOTFILES[CONFIGS]}/.p10k.zsh'"       \
      depth="1"                                                                \
@romkatv/powerlevel10k

# lsd ~ the next gen ls command
zinit for                                                                      \
      from"gh-r"                                                               \
      as"command"                                                              \
      bpick"lsd-*"                                                             \
      pick"lsd-*/lsd"                                                          \
      atload"hook lsd.atload.zsh"                                              \
      sbin"lsd -> lsd"                                                         \
@lsd-rs/lsd

# ==============================================================================
# -- fzf -----------------------------------------------------------------------
# ==============================================================================
zinit default-ice -cq wait"0" lucid light-mode

zinit for                                                                      \
      pack"bgn-binary+keys"                                                    \
      atload"FZF_CONFIG_PATH='${DOTFILES[CONFIGS]}/fzf.conf'"                  \
    @fzf                                                                       \
      atload"hook fzf-preview.atload.zsh"                                      \
      blockf                                                                   \
      depth"1"                                                                 \
    @yuki-yano/fzf-preview.zsh                                                 \
      atload"hook fzf-tab.atload.zsh"                                          \
    @Aloxaf/fzf-tab
# @redxtech/zsh-fzf-utils                                                        \
#       as"program"                                                              \
#       atload"hook fzf-help.atload.zsh"                                         \
#       atclone"./install --user"                                                \
# @BartSte/fzf-help

# ==============================================================================
# -- github-releases -----------------------------------------------------------
# ==============================================================================
zinit default-ice -cq wait"0" lucid light-mode

zinit for \
      as"program" \
      atclone'./direnv hook zsh > zhook.zsh' \
      from"gh-r" \
      mv"direnv* -> direnv" \
      src'zhook.zsh' \
  direnv/direnv

# Will work for any build system
# zinit for                                                                      \
      # configure                                                                \
      # make                                                                     \
    # @universal-ctags/ctags
#
# zsh-abbr ~ is the zsh manager for abbreviations
# zinit for                                                                      \
      # atload"hook zsh-abbr.atload.zsh"                                         \
      # atpull"%atclone"                                                         \
      # dl"https://github.com/olets/zsh-abbr/tree/main/completions/_abbr"        \
    # olets/zsh-abbr

# zinit for                                                                      \
# MichaelAquilina/zsh-you-should-use                                             \
# momo-lab/zsh-abbrev-alias

zinit for                                                                      \
      atload"hook zeno.atload.zsh"                                             \
      blockf                                                                   \
      depth"1"                                                                 \
      sbin"**/zeno -> zeno"                                                    \
yuki-yano/zeno.zsh

# zsh-256color ~ A zsh plugin that enables 256 color support
zinit for                                                                      \
pack ls_colors                                                                 \
pack dircolors-material                                                        \
unixorn/warhol.plugin.zsh                                                      \
chrissicool/zsh-256color

# neovim ~ the next gen Vim
zinit for                                                                      \
  from"gh-r"                                                                   \
  sbin"**/nvim -> nvim"                                                        \
  ver"nightly"                                                                 \
neovim/neovim

# tmux-vim-integration.plugin.zsh ~ a zsh plugin for tmux and v`im integration
zinit for                                                                      \
  atload"hook tmux-vim-integration.atload.zsh"                                 \
@jsahlen/tmux-vim-integration.plugin.zsh

## zsh-lint, zsh-sweep ~ linters  for zsh and shell scripts
zinit for zdharma-continuum/{zsh-lint,zsh-sweep}

# shell
zinit for                                                                      \
  from"gh-r"                                                                   \
  sbin"**/sh* -> shfmt"                                                        \
@mvdan/sh

zinit for                                                                      \
zdharma-continuum/zsh-startify                                                 \
zdharma-continuum/zzcomplete                                                   \
zdharma-continuum/git-url

# zsh-safe-rm ~ prevent the accidental deletion of important files
zinit for mattmc3/zsh-safe-rm

# zsh-replace-multiple-dots ~ A Zsh plugin that replaces multiple dots
zinit for momo-lab/zsh-replace-multiple-dots

# zsh-plugin-reload ~ A Zsh plugin that reloads plugins
zinit for aubreypwd/zsh-plugin-reload

# zsh-recall ~ makes history easier
zinit for mango-tree/zsh-recall

# zsh-autopair ~ auto-pairing quotes, brackets, etc in command line
zinit for                                                                      \
  nocompletions                                                                \
  compile"*.zsh"                                                               \
  atload"hook zsh-autopair.atload.zsh"                                         \
  atinit"hook zsh-autopair.atinit.zsh"                                         \
hlissner/zsh-autopair

# auto installs the iterm2 shell integration for zsh
zinit for                                                                      \
  pick"shell_integration/zsh"                                                  \
  sbin"utilities/*"                                                            \
gnachman/iTerm2-shell-integration

# git-fuzzy ~ a CLI interface to git that relies on fzf
# zinit for                                                                      \
#   as"program"                                                                  \
#   pick"bin/git-fuzzy"                                                          \
#   sbin"git-fuzzy -> git-fuzzy"                                                 \
# bigH/git-fuzzy

# ==============================================================================
# -- Second --------------------------------------------------------------------
# ==============================================================================

zinit default-ice -cq wait"1" lucid light-mode

# lazygit ~ A simple terminal UI for git commands
zinit for                                                                      \
      as"command"                                                              \
      from"gh-r"                                                               \
      sbin"lazygit -> lazygit"                                                 \
  jesseduffield/lazygit

zinit for                                                                      \
      from"gh-r"                                                               \
      as"program"                                                              \
      mv"gh_*/bin/gh* -> gh"                                                   \
      sbin"gh -> gh"                                                           \
  @cli/cli

zinit for                                                                      \
      from"gh-r"                                                               \
      mv"tealdeer* -> tealdeer"                                                \
      pick"tealdeer -> tealdeer"                                               \
      dl"https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer
        -> _tealdeer"                                                          \
      sbin"tealdeer -> tldr"                                                   \
  @dbrgn/tealdeer

# declare-zsh ~ A Zsh plugin that provides a simple way to declare variables
zinit for                                                                      \
  zdharma-continuum/declare-zsh

# delta ~ A viewer for git and diff output
zinit for                                                                      \
      as"command"                                                              \
      from"gh-r"                                                               \
      sbin"**/delta -> delta"                                                  \
      mv"delta* -> delta"                                                      \
      pick"delta"                                                              \
  dandavison/delta

# glow ~ A markdown reader for the terminal
zinit for                                                                      \
      from"gh-r"                                                               \
      sbin"**/glow -> glow"                                                    \
  @charmbracelet/glow

# zoxide ~ A smarter cd command
zinit for                                                                      \
      as"command"                                                              \
      from"gh-r"                                                               \
      mv"zoxide -> zoxide"                                                     \
      atclone"./zoxide init zsh > init.zsh"                                    \
      atpull"%atclone"                                                         \
      src"init.zsh"                                                            \
      nocompile"!"                                                             \
  @ajeetdsouza/zoxide

# github-Copilot ~ a cli for github copilot
zinit snippet "https://gist.githubusercontent.com/iloveitaly/a79ffc31ef5b4785da8950055763bf52/raw/4140dd8fa63011cdd30814f2fbfc5b52c2052245/github-copilot-cli.zsh"

# deno ~ A simple and
zinit for                                                                      \
      from"gh-r"                                                               \
      nocompile                                                                \
      sbin"* -> deno"                                                          \
  @denoland/deno

# yank ~ Yank terminal output to clipboard
zinit for                                                                      \
      make                                                                     \
      sbin"yank.1 -> yank"                                                     \
  @mptre/yank

# -- snippits --
zinit snippet "$ZDOTDIR/snippets.zsh"

# -- dotfiles completons --
zinit snippet "$ZDOTDIR/completions.zsh"

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "$DOTFILES[CONFIGS]/.p10k.zsh" ]] || source "$DOTFILES[CONFIGS]/.p10k.zsh"
