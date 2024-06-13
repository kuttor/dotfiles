#!/usr/bin/env zsh
#-*- mode: shell-script -*-2
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
ZSH_PROFILE=0
[[ "${ZSH_PROFILE}" == 1 ]] && zmodload zsh/zprof || ZSH_PROFILE=0

# ==============================================================================
# -- zsh configs ---------------------------------------------------------------
# ==============================================================================
zinit snippet "${ZDOTDIR}/paths.zsh"
zinit snippet "${ZDOTDIR}/autoload.zsh"
zinit snippet "${ZDOTDIR}/options.zsh"
zinit snippet "${ZDOTDIR}/keybind.zsh"
zinit snippet "${ZDOTDIR}/modules.zsh"
zinit snippet "${ZDOTDIR}/aliases.zsh"
zinit snippet "${ZDOTDIR}/history.zsh"

# ==============================================================================
# -- zinit annexes -------------------------------------------------------------
# ==============================================================================
zurbo zdharma-continuum/zinit-annex-binary-symlink
zurbo zdharma-continuum/zinit-annex-bin-gem-node
zurbo zdharma-continuum/zinit-annex-meta-plugins
zurbo zdharma-continuum/zinit-annex-default-ice
zurbo zdharma-continuum/zinit-annex-as-monitor
zurbo zdharma-continuum/zinit-annex-link-man
zurbo zdharma-continuum/zinit-annex-patch-dl
zurbo zdharma-continuum/zinit-annex-submods
zurbo zdharma-continuum/zinit-annex-pull
zurbo zdharma-continuum/zinit-annex-man

# ==============================================================================
# -- meta plugins --------------------------------------------------------------
# ==============================================================================
zurbo skip'fzf-go peco-go' fuzzy-src
zurbo skip'hexyl hyperfine' for sharkdp
zurbo skip'dircolors-material sharkdp' for console-tools
zurbo skip'fast-syntax-highlighting' for zdharma
zurbo for zsh-users+fast


# ==============================================================================
# -- load first ----------------------------------------------------------------
# ==============================================================================

zurbo mattmc3/zman
zurbo depth"1" @romkatv/powerlevel10k


# ==============================================================================
# -- github programs -----------------------------------------------------------
# ==============================================================================

zurbo gh atload_hook bpick"lsd-*" pick"lsd-*/lsd" sbin"lsd -> lsd" @lsd-rs/lsd
zurbo gh
# ==============================================================================
# -- fzf -----------------------------------------------------------------------
# ==============================================================================

zurbo pack"bgn-binary+keys" @fzf
zurbo atload_hook blockf depth"1" @yuki-yano/fzf-preview.zsh
zurbo atload_hook Aloxaf/fzf-tab
zurbo atload_hook as"program" atclone"./install --user" @BartSte/fzf-help
zurbo @redxtech/zsh-fzf-utils

# ==============================================================================
# -- github-releases -----------------------------------------------------------
# ==============================================================================
zurbo atload_hook atpull"%atclone" olets/zsh-abbr
zurbo atload_hook blockf depth"1" sbin"**/zeno -> zeno" yuki-yano/zeno.zsh
zurbo pack ls_colors
zurbo pack dircolors-material
zurbo unixorn/warhol.plugin.zsh
zurbo chrissicool/zsh-256color
zurbo sbin"**/nvim -> nvim" ver"nightly" neovim/neovim
zurbo atload_hook @jsahlen/tmux-vim-integration.plugin.zsh
zurbo zdharma-continuum/zsh-lint
zurbo zdharma-continuum/zsh-sweep
zurbo zdharma-continuum/zsh-startify
zurbo zdharma-continuum/zzcomplete
zurbo zdharma-continuum/git-url
zurbo sbin"**/sh* -> shfmt" @mvdan/sh
zurbo sbin"*/shellcheck -> shellcheck" koalaman/shellcheck
zurbo mattmc3/zsh-safe-rm
zurbo momo-lab/zsh-replace-multiple-dots
zurbo baubreypwd/zsh-plugin-reload
zurbo mango-tree/zsh-recall
zurbo nocompletions compile"*.zsh" atload_hook atinit_hook lissner/zsh-autopair
zurbo pick"shell_integration/zsh" sbin"utilities/*" gnachman/iTerm2-shell-integration
zurbo gh pick"bin/git-fuzzy" sbin"git-fuzzy -> git-fuzzy" bigH/git-fuzzy

# ==============================================================================
# -- 2nd Load ------------------------------------------------------------------
# ==============================================================================

zinit default-ice -cq wait"1" lucid light-mode
zurbo gh sbin"lazygit -> lazygit" jesseduffield/lazygit
zurbo gh mv"gh_*/bin/gh* -> gh" sbin"gh -> gh" @cli/cli

zinit for                                                                      \
      id-as                                                                    \
      from"gh-r"                                                               \
      mv"tealdeer* -> tealdeer"                                                \
      pick"tealdeer -> tealdeer"                                               \
      dl"https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer
        -> _tealdeer"                                                          \
      sbin"tealdeer -> tldr"                                                   \
  @dbrgn/tealdeer

# declare-zsh ~ A Zsh plugin that provides a simple way to declare variables
zinit for                                                                      \
      id-as"zsh-declare"                                                       \
  zdharma-continuum/declare-zsh

# delta ~ A viewer for git and diff output
zinit for                                                                      \
      id-as"delta"                                                             \
      as"command"                                                              \
      from"gh-r"                                                               \
      sbin"**/delta -> delta"                                                  \
      mv"delta* -> delta"                                                      \
      pick"delta"                                                              \
  dandavison/delta

# glow ~ A markdown reader for the terminal
zinit for                                                                      \
      id-as"glow"                                                              \
      from"gh-r"                                                               \
      sbin"**/glow -> glow"                                                    \
  @charmbracelet/glow

# zoxide ~ A smarter cd command
zinit for                                                                      \
      id-as"zoxide"                                                            \
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
      id-as                                                                    \
      from"gh-r"                                                               \
      nocompile                                                                \
      sbin"* -> deno"                                                          \
  @denoland/deno

# -- snippits --
zinit snippet "$ZDOTDIR/snippets.zsh"

# -- dotfiles completons --
zinit snippet "$ZDOTDIR/completions.zsh"

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "$DOTFILES[CONFIGS]/.p10k.zsh" ]] || source "$DOTFILES[CONFIGS]/.p10k.zsh"