#!/usr/bin/env zsh

# -- power10k instant prompt ----------------------------------------------------
local IPATH="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r $IPATH ]] && source $IPATH

# --- zinit load ----------------------------------------------------------------
local ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && \
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

() {
  local URL="https://github.com/zdharma-continuum/zinit.git"
  [ -d "$ZINIT_HOME" ]|| git clone $URL "$ZINIT_HOME"
}

# ==============================================================================
# -- local variables -----------------------------------------------------------
# ==============================================================================
ZCOMN() { echo "id-as lucid wait for" }

# ==============================================================================
# -- zsh configs ---------------------------------------------------------------
# ==============================================================================
zinit snippet "$ZDOTDIR/paths.zsh"                                               
zinit snippet "$ZDOTDIR/autoload.zsh"                                                
zinit snippet "$ZDOTDIR/options.zsh"                                                 
zinit snippet "$ZDOTDIR/keybind.zsh"                                                 
zinit snippet "$ZDOTDIR/aliases.zsh"                                                 
zinit snippet "$ZDOTDIR/history.zsh"
  
# ==============================================================================
# -- annexes -------------------------------------------------------------------
# ==============================================================================
zinit id-as lucid wait for                                                     \
  "@zdharma-continuum/zinit-annex-binary-symlink"                              \
  "@zdharma-continuum/zinit-annex-bin-gem-node"                                \
  "@zdharma-continuum/zinit-annex-default-ice"                                 \
  "@zdharma-continuum/zinit-annex-link-man"                                    \
  "@zdharma-continuum/zinit-annex-patch-dl"                                    \
  "@zdharma-continuum/zinit-annex-submods"                                     \
  "@zdharma-continuum/zinit-annex-man"

# ==============================================================================
# -- core ----------------------------------------------------------------------
# ==============================================================================
zinit default-ice -cq lucid id-as light-mode from"gh-r" wait"0"

zinit for "@mafredri/zsh-async"

# ==============================================================================
# -- autocompletions -----------------------------------------------------------
# ==============================================================================

# -- inshellisense -------------------------------------------------------------
zinit pack param='inshellisense → is' for "@any-node"

# ==============================================================================
# -- navigation ---------------------------------------------------------------
# ==============================================================================

# add to hook
#ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
#ZSH_HIGHLIGHT_REGEXP+=('^\s*(\.){2,}$' fg=green)
# -- dot-up --
zinit $COMN "@toku-sa-n/zsh-dot-up"

# -- zoxide: "smarter jump enhancer for cd" ------------------------------------
zinit sbin"zoxide -> zoxide" atload"hook zoxide.atload.zsh" for "@ajeetdsouza/zoxide"

# ==============================================================================
# -- fzf -----------------------------------------------------------------------
# ==============================================================================
zinit pack"bgn-binary+keys" for "@fzf"
zinit $COMN "@Aloxaf/fzf-tab"
zinit $COMN atload'' as'program' atclone'./install --user' "@BartSte/fzf-help"

# ==============================================================================
# -- theming -------------------------------------------------------------------
# ==============================================================================

# -- powerline10k --
zinit depth"1" $COMN "@romkatv/powerlevel10k"

# -- ls_colors --
zinit pack for "@ls_colors"

# ==============================================================================
# -- programming ---------------------------------------------------------------
# ==============================================================================

# -- Zsh linters --
zinit $COMN "@zdharma-continuum/zsh-lint"
zinit $COMN "@@zdharma-continuum/zsh-sweep"

# -- syntax shell checkers --
zinit sbin"*/shellcheck -> shellcheck"  $COMN "@koalaman/shellcheck"
zinit sbin"**/sh* -> shfmt"             $COMN "@mvdan/sh"


# zurbo mattmc3/zman
# zurbo mattmc3/zsh-safe-rm
# zurbo momo-lab/zsh-replace-multiple-dots
# zurbo nocompletions compile"*.zsh" atload_hook atinit_hook hlissner/zsh-autopair

zinit $COMN "@lsd-rs/lsd"

# zinit id-as sbin"utilities/*"      for "gnachman/iTerm2-shell-integration"
# zinit id-as sbin"**/zeno -> zeno" blockf depth"1" for "yuki-yano/zeno.zsh"
# zinit id-as sbin"git-fuzzy -> git-fuzzy" pick"bin/git-fuzzy" for "bigH/git-fuzzy"

# ==============================================================================
# -- tools ---------------------------------------------------------------------
# ==============================================================================

# -- section defaults --
zinit default-ice --clear --quiet                                              \
      lucid                                                                    \
      id-as                                                                    \
      wait"1"                                                                  \
      from"gh-r"                                                               \
      light-mode

# -- plugins --
zinit sbin'**/bat -> bat'                                   for "@sharkdp/bat"
zinit sbin"* -> deno"                                       for "denoland/deno"
zinit sbin"assh* -> assh"                                   for "moul/assh"
zinit sbin"sd* -> sd"                                       for "chmln/sd"
zinit sbin"tre* -> tre"                                     for "dduan/tre"
zinit sbin"mcfly* -> mcfly" ver"v0.8.3"                     for "cantino/mcfly"
zinit sbin"fx* -> fx" ver"32.0.0"                           for "antonmedv/fx"
zinit sbin"lemmeknow* -> lemmeknow"                         for "swanandx/lemmeknow"
zinit sbin"**/nvim -> nvim" ver"nightly"                    for "neovim/neovim"
zinit sbin"lazygit -> lazygit"                              for "jesseduffield/lazygit"
zinit sbin"gh_*/bin/gh* -> gh"                              for "cli/cli"
zinit sbin"tealdeer* -> tldr"                               for "dbrgn/tealdeer"
zinit sbin"**/delta -> delta"                               for "dandavison/delta"
zinit sbin"**/glow -> glow"                                 for "charmbracelet/glow"


# ==============================================================================
# -- Null Progrsms -------------------------------------------------------------
# ==============================================================================

# -- homebrew --
zinit for \
    as'null' \
    atclone'%atpull' \
    atpull'
      ./bin/brew update --preinstall \
      && ln -sf $PWD/completions/zsh/_brew $ZINIT[COMPLETIONS_DIR] \
      && rm -f brew.zsh \
      && ./bin/brew shellenv --dummy-arg > brew.zsh \
      && zcompile brew.zsh' \
    depth'3' \
    nocompletions \
    sbin'bin/brew' \
    src'brew.zsh' \
  homebrew/brew


# -- snippits --
zinit snippet "$ZDOTDIR/snippets.zsh"
zinit snippet "$ZDOTDIR/completions.zsh"

# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "$DOTFILES[CONFIGS]/.p10k.zsh" ]] || source "$DOTFILES[CONFIGS]/.p10k.zsh"
