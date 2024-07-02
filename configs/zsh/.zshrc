#!/usr/bin/env zsh
#-*- mode: shell-script -*-2
#vim: ft=zsh st=zsh sw=2 ts=2 sts=0

# -- power10k instant prompt --
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zurbo zdharma-continuum/zinit-annex-rust
# zurbo zdharma-continuum/zinit-annex-man

# ==============================================================================
# -- meta plugins --------------------------------------------------------------
# ==============================================================================
zinit for                                                                      \
      skip'hexyl hyperfine'                                                    \
    sharkdp                                                                    \
      skip'dircolors-material sharkdp'                                         \
    console-tools                                                              \
      skip'fast-syntax-highlighting'                                           \
    zdharma                                                                    \
    zsh-users+fast

# ==============================================================================
# -- fzf -----------------------------------------------------------------------
# ==============================================================================
zinit pack"bgn-binary+keys" for @fzf
zurbo atload_hook blockf depth"1" @yuki-yano/fzf-preview.zsh
zurbo atload_hook Aloxaf/fzf-tab
zurbo atload_hook as"program" atclone"./install --user" @BartSte/fzf-help
zurbo @redxtech/zsh-fzf-utils

# ==============================================================================
# -- Early-Loaders -------------------------------------------------------------
# ==============================================================================
zurbo depth"1" @romkatv/powerlevel10k
zurbo atload_hook atpull"%atclone" olets/zsh-abbr

zinit pack for ls_colors
zinit pack for dircolors-material
zurbo unixorn/warhol.plugin.zsh
zurbo chrissicool/zsh-256color

zurbo atload_hook @jsahlen/tmux-vim-integration.plugin.zsh

zinit id-as for zdharma-continuum/zsh-lint
zinit id-as for zdharma-continuum/zsh-sweep
zinit id-as for zdharma-continuum/zsh-startify
zinit id-as for zdharma-continuum/zzcomplete
zinit id-as for zdharma-continuum/declare-zsh
zurbo mattmc3/zman
zurbo mattmc3/zsh-safe-rm
zurbo momo-lab/zsh-replace-multiple-dots
zurbo aubreypwd/zsh-plugin-reload
zurbo mango-tree/zsh-recall
zurbo nocompletions compile"*.zsh" atload_hook atinit_hook hlissner/zsh-autopair

zinit for @lsd-rs/lsd
zinit id-as sbin"**/sh* -> shfmt"  for "@mvdan/sh"
zinit id-as sbin"utilities/*"      for "gnachman/iTerm2-shell-integration"
zinit id-as sbin"**/zeno -> zeno" blockf depth"1" for "yuki-yano/zeno.zsh"
# zinit id-as sbin"git-fuzzy -> git-fuzzy" pick"bin/git-fuzzy" for "bigH/git-fuzzy"

# ==============================================================================
# -- github-released late-loaders ----------------------------------------------
# ==============================================================================

# -- section defaults --
zinit default-ice --clear --quiet                                              \
      lucid                                                                    \
      id-as                                                                    \
      wait"1"                                                                  \
      from"gh-r"                                                               \
      light-mode

# -- plugins --
# zinit sbin"lsd* -> lsd"                     for "@lsd-rs/lsd"
zinit sbin"* -> deno"                       for "denoland/deno"
zinit sbin"assh* -> assh"                   for "moul/assh"
zinit sbin"sd* -> sd"                       for "chmln/sd"
zinit sbin"tre* -> tre"                     for "dduan/tre"
zinit sbin"mcfly* -> mcfly" ver"v0.8.3"     for "cantino/mcfly"
zinit sbin"fx* -> fx" ver"32.0.0"           for "antonmedv/fx"
zinit sbin"lemmeknow* -> lemmeknow"         for "swanandx/lemmeknow"
zinit sbin"*/shellcheck -> shellcheck"      for "koalaman/shellcheck"
zinit sbin"**/nvim -> nvim" ver"nightly"    for "neovim/neovim"
zinit sbin"lazygit -> lazygit"              for "jesseduffield/lazygit"
zinit sbin"gh_*/bin/gh* -> gh"              for "cli/cli"
zinit sbin"tealdeer* -> tldr"               for "dbrgn/tealdeer"
zinit sbin"**/delta -> delta"               for "dandavison/delta"
zinit sbin"**/glow -> glow"                 for "charmbracelet/glow"
zinit sbin"zoxide -> zoxide"                for "ajeetdsouza/zoxide"

# -- snippits --
zinit snippet "$ZDOTDIR/snippets.zsh"
zinit snippet "$ZDOTDIR/completions.zsh"

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "$DOTFILES[CONFIGS]/.p10k.zsh" ]] || source "$DOTFILES[CONFIGS]/.p10k.zsh"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/configs/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/configs/zsh/.p10k.zsh ]] || source ~/.dotfiles/configs/zsh/.p10k.zsh
