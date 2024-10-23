# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#! /usr/bin/env zsh

# initializes the power10k instant prompt
p10k_instant_prompt

# initialize ba environment variables
initialize_environment

# check and install zinit if not installed
initialize_zinit

# Setup zinit environment variables
typeset -gxA ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
ZINIT_PLUGINS_DIR="$ZINIT_HOME/plugins"
ZINIT_SNIPPETS_DIR="$ZINIT_HOME/snippets"
ZINIT_COMPLETIONS_DIR="$ZINIT_HOME/completions"
ZINIT_BIN_DIR_NAME="$ZINIT_HOME/bin"
ZINIT_BIN_DIR="$ZINIT_HOME/bin"
ZPFX="$ZINIT_HOME/polaris"

alias zi='zinit '

# =================================================================================================
# -- zsh-configs -----------------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet                                                                    \
light-mode                                                                                        \
lucid                                                                                             \
wait'0'

zi for                                                                                            \
id-as'zshconf:autoload'    is-snippet @$ZDOTDIR/autoload.zsh                                      \
id-as'zshconf:options'     is-snippet @$ZDOTDIR/options.zsh                                       \
id-as'zshconf:keybind'     is-snippet @$ZDOTDIR/keybind.zsh                                       \
id-as'zshconf:aliases'     is-snippet @$ZDOTDIR/aliases.zsh                                       \
id-as'zshconf:completions' is-snippet @$ZDOTDIR/completions.zsh

# =================================================================================================
# -- enhancing manpages with manpath --------------------------------------------------------------
# =================================================================================================
zi for                                                     \
id-as'annex-man'        @zdharma-continuum/zinit-annex-man \
id-as'asciidoctor' pack @asciidoctor

# ==================================================================================================
# -- omz plugins and libraries ---------------------------------------------------------------------
# ==================================================================================================
zi default-ice --clear --quiet \
id-as'oh-my-zsh' \
light-mode \
lucid \
wait'0' \
as-snippet

zi for \
OMZL::completion.zsh \
OMZL::compfix.zsh \
OMZL::correction.zsh \
OMZL::history.zsh \
OMZP::brew \
OMZP::gnu-utils \
OMZP::colorize \
OMZP::web-search \
OMZP::ssh \
OMZP::pip \
OMZP::cp \
OMZP::grc \
OMZP::urltools \
atload'use magic-enter.atload' \
OMZP::magic-enter

# zi for \
# as'completions' \
# atclone'buildx* completion zsh > _buildx' \
# from"gh-r" \
# sbin'!buildx-* -> buildx' \
  # @docker/buildx credential helpers

# =================================================================================================
# -- zsh plugins ------------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet \
light-mode \
lucid \
wait'0' \
from'gh-r'

# github releases
zi for \
id-as'lazygit'       sbin'lazygit -> lazygit'                @jesseduffield/lazygit \
id-as'lemmeknow'     sbin'lemmeknow* -> lemmeknow'           @swanandx/lemmeknow \
id-as'rg'            sbin'**/rg -> rg'                       @BurntSushi/ripgrep \
id-as'glow'          sbin'**/glow'                           @charmbracelet/glow \
id-as'nvim'          sbin'**/nvim -> nvim'                   @neovim/neovim \
id-as'mcfly'          sbin'mcfly* -> mcfly'                     @cantino/mcfly \
id-as'deno'          sbin'* -> deno'                         @denoland/deno \
id-as'fx'            sbin'fx* -> fx'                         @antonmedv/fx \
id-as'assh'          sbin'assh* -> assh'                     @moul/assh \
id-as'shfmt'         sbin'**/sh* -> shfmt'                   @mvdan/sh \
id-as'gh'            sbin'gh_*/bin/gh* -> gh'                @cli/cli \
id-as'diff-so-fancy' sbin'**/diff-so-fancy -> diff-so-fancy' @so-fancy/diff-so-fancy \
id-as'fastfetch'     sbin'**/fastfetch -> fastfetch'         @fastfetch-cli/fastfetch \
id-as'shellcheck'    sbin'*/shellcheck -> shellcheck'        @koalaman/shellcheck \
id-as'tree-sitter'   sbin'*->tree-sitter'     nocompile      @tree-sitter/tree-sitter

# github releases that use hooks 
zi for \
id-as'bat' sbin'**/bat -> bat' atload'use bat.atload'                         @sharkdp/bat \
id-as'tre' sbin'tre* -> tre'   atload'use tre.atload'                         @dduan/tre   \
id-as'fd'  sbin'**/fd -> fd'   atload'use fd.atload'  atclone'use fd.atclone' @sharkdp/fd  \
id-as'lsd' sbin'*/lsd -> lsd'  atload'use lsd.atload'                         @lsd-rs/lsd
  
  

# -- zoxide: "smarter jump enhancer for cd" --
zi for id-as'zoxide' \
sbin'zoxide -> zoxide' \
atclone'./zoxide init zsh > init.zsh' \
atpull'%atclone' \
src'init.zsh' \
nocompile'!' \
  @ajeetdsouza/zoxide

# =================================================================================================
# -- other releases -------------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet \
light-mode \
lucid \
wait'0'

zi for \
id-as'zui'        @z-shell/zui \
id-as'zsh-async'  @mafredri/zsh-async \
id-as'zsh-dot-up' @toku-sa-n/zsh-dot-up

zi for                                                                                        \
id-as'fzf-tab'            atload'use fzf-tab.atload'            @Aloxaf/fzf-tab               \
id-as'fzf-tab-completion' atload'use fzf-tab-completion.atload' @lincheney/fzf-tab-completion \

zi for                                                                                        \
id-as'zsh-lint' @z-shell/zsh-lint \
id-as'zsh-sweep' @zdharma-continuum/zsh-sweep \
id-as'safe-rm' @mattmc3/zsh-safe-rm \
id-as'multiple-dots' @momo-lab/zsh-replace-multiple-dots \
id-as'zman' @mattmc3/zman

#zinit id-as'broot' rustup cargo'broot' nocompile sbin'* -> *' for @zdharma-continuum/null

zi for \
id-as'broot' atclone'broot --print-shell-function zsh > broot.zsh' \
atpull'%atclone' \
run-atpull \
atload'source broot.zsh' \
as"null" \
@zdharma-continuum/null

# ==================================================================================================
# -- non-gh-rel packages ---------------------------------------------------------------------------
# ==================================================================================================
zi default-ice --clear --quiet \
lucid \
light-mode \
wait'0'

zi for \
id-as'fzf' pack'bgn-binary+keys' atload"use fzf.atload" @fzf \
id-as'dircolors' pack @dircolors-material \
id-as'ls_colors' pack @ls_colors

zi for \
id-as'p10k' depth'1' @romkatv/powerlevel10k \
id-as'brew' sbin'bin/brew -> brew' depth'3' atload'use brew.atload' atclone'use brew.atclone' @homebrew/brew \
id-as'zeno' sbin'**/zeno -> zeno' depth'1' atload'use zeno.atload' @yuki-yano/zeno.zsh \
id-as'tealdeer' sbin'tealdeer* -> tldr' @dbrgn/tealdeer \
id-as'git-fuzzy' sbin'bin/git-fuzzy -> gfuzzy' blockf atload'use git-fuzzy.atload' @bigH/git-fuzzy \
id-as'url-hl' sbin'url/url* -> url-highlighter' atload'use url-hl.atload' @ascii-soup/zsh-url-highlighter

# ==================================================================================================
# -- rust compiler environment ---------------------------------------------------------------------
# ==================================================================================================
zi default-ice --clear --quiet \
lucid \
light-mode \
wait'0' \
id-as'rust'

# Installation of Rust compiler environment via the z-a-rust annex
zi for \
id-as'rust' \
as'null' \
rustup \
sbin="bin/* -> *" \
atload='use rust.atload' \
@zdharma-continuum/null

# zi for id-as'sd' rustup cargo'!sd' @chmln/sd
# zi for id-as'delta' rustup cargo'!delta' @zdharma-continuum/null

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/config/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/config/zsh/.p10k.zsh ]] || source ~/.dotfiles/config/zsh/.p10k.zsh
