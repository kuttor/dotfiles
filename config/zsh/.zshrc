#!/usr/bin/env zsh

# initializes the power10k instant prompt
p10k_instant_prompt

# check and install zinit if not installed
initialize_zinit

# =================================================================================================
# -- zsh configs ----------------------------------------------------------------------------------
# =================================================================================================
zi default-ice                                                                                     \
--clear                                                                                            \
--quiet                                                                                            \
  lucid                                                                                            \
  wait'0'                                                                                          \
  light-mode

zi for    id-as'autoload'       is-snippet                           @$ZDOTDIR/autoload.zsh        \
          id-as'options'        is-snippet                           @$ZDOTDIR/options.zsh         \
          id-as'keybind'        is-snippet                           @$ZDOTDIR/keybind.zsh         \
          id-as'aliases'        is-snippet                           @$ZDOTDIR/aliases.zsh         \
          id-as'completions'    is-snippet                           @$ZDOTDIR/completions.zsh

# ==================================================================================================
# -- omz plugins and libraries ---------------------------------------------------------------------
# ==================================================================================================
zi for                                                                                             \
          OMZL::completion.zsh                                                                     \
          OMZL::compfix.zsh                                                                        \
          OMZL::correction.zsh                                                                     \
          OMZL::history.zsh                                                                        \
          OMZP::brew                                                                               \
          OMZP::gnu-utils                                                                          \
          OMZP::colorize                                                                           \
          OMZP::web-search                                                                         \
          OMZP::ssh                                                                                \
          OMZP::pip                                                                                \
          OMZP::cp                                                                                 \
          OMZP::grc                                                                                \
          OMZP::urltools                                                                           \
          atload'use magic-enter.atload'                                                           \
          OMZP::magic-enter

# =================================================================================================
# -- github packages ------------------------------------------------------------------------------
# =================================================================================================
zi default-ice                                                                                     \
--clear                                                                                            \
--quiet                                                                                            \
  lucid                                                                                            \
  wait'0'                                                                                          \
  from'gh-r'                                                                                       \
  light-mode

zi for    id-as'lazygit'     sbin'lazygit -> lazygit'                   @jesseduffield/lazygit     \
          id-as'lemmeknow'   sbin'lemmeknow* -> lemmeknow'              @swanandx/lemmeknow        \
          id-as'rg'          sbin'**/rg -> rg'                          @BurntSushi/ripgrep        \
          id-as'glow'        sbin'**/glow'                              @charmbracelet/glow        \
          id-as'nvim'        sbin'**/nvim -> nvim'                      @neovim/neovim             \
          id-as'mcfly'       sbin'mcfly* -> mcfly'                      @cantino/mcfly             \
          id-as'deno'        sbin'* -> deno'                            @denoland/deno             \
          id-as"bat"         sbin'**/bat -> bat' atload'use bat.atload' @sharkdp/bat               \
          id-as'fx'          sbin'fx* -> fx'                            antonmedv/fx               \
          id-as'assh'        sbin'assh* -> assh'                        @moul/assh                 \
          id-as'tre'         sbin'tre* -> tre'                          @dduan/tre                 \
          id-as'fd'          sbin'**/fd -> fd'   atload'use fd.atload' atclone'use fd.atclone' @sharkdp/fd \
          id-as'shfmt'       sbin'**/sh* -> shfmt'                      @mvdan/sh                  \
          id-as'gh'          sbin'gh_*/bin/gh* -> gh'                   @cli/cli                   \
          id-as'shellcheck'  sbin'*/shellcheck -> shellcheck'           @koalaman/shellcheck       \
          id-as'fastfetch'   sbin'**/fastfetch -> fastfetch'            @fastfetch-cli/fastfetch   \
          id-as'lsd'         sbin'*/lsd -> lsd' atload'use lsd.atload'  @lsd-rs/lsd                \
          id-as'diff-so-fancy' sbin'**/diff-so-fancy -> diff-so-fancy'  @so-fancy/diff-so-fancy

# -- zoxide: "smarter jump enhancer for cd" --
zi for id-as'zoxide'                                                                               \
          sbin"zoxide -> zoxide"                                                                   \
          atclone"./zoxide init zsh > init.zsh"                                                    \
          atpull"%atclone"                                                                         \
          src"init.zsh"                                                                            \
          nocompile'!'                                                                             \
          @ajeetdsouza/zoxide

# =================================================================================================
# -- other releases -------------------------------------------------------------------------------
# =================================================================================================
zi default-ice                                                                                     \
--clear                                                                                            \
--quiet                                                                                            \
  id-as                                                                                            \
  lucid                                                                                            \
  wait'0'                                                                                          \
  light-mode

zi for                                                                                                \
  id-as'zsh-async'                                                @mafredri/zsh-async                 \
  id-as'zsh-dot-up'                                               @toku-sa-n/zsh-dot-up               \
  id-as'fzf-tab'            atload'use fzf-tab.atload'            @Aloxaf/fzf-tab                     \
  id-as'fzf-tab-completion' atload'use fzf-tab-completion.atload' @lincheney/fzf-tab-completion       \
  id-as'zui'                                                      @z-shell/zui                        \
  id-as'zsh-lint'                                                 @z-shell/zsh-lint                   \
  id-as'zsh-sweep'                                                @zdharma-continuum/zsh-sweep        \
  id-as'safe-rm'                                                  @mattmc3/zsh-safe-rm                \
  id-as'multiple-dots'                                            @momo-lab/zsh-replace-multiple-dots \
  id-as'zman'                                                     @mattmc3/zman

# ==================================================================================================
# -- non-gh-rel packages ---------------------------------------------------------------------------
# ==================================================================================================
zi default-ice                                                                                     \
--clear                                                                                            \
--quiet                                                                                            \
  lucid                                                                                            \
  light-mode                                                                                       \
  wait'0'

zi for                                                                                             \
  id-as'fzf'        pack'bgn-binary+keys'  atload"use fzf.atload"  @fzf                            \
  id-as'dircolors'  pack                                           @dircolors-material             \
  id-as'ls_colors'  pack                                           @ls_colors

zi for                                                                                             \
  id-as'p10k'                              depth'1'                                    @romkatv/powerlevel10k                   \
  id-as'brew'      sbin'bin/brew -> brew'  depth'3'      atload'use brew.atload'       @homebrew/brew                           \
  id-as'zeno'      sbin'**/zeno -> zeno'   depth'1'      atload'use zeno.atload'       @yuki-yano/zeno.zsh                      \
  id-as'tealdeer'  sbin'tealdeer* -> tldr'               atload'use tealdeer.atload'   @dbrgn/tealdeer                          \
  id-as'git-fuzzy' sbin'bin/git-fuzzy -> gfuzzy' blockf  atload'use git-fuzzy.atload'  @bigH/git-fuzzy                          \
  id-as'url-hl'    sbin'url/url* -> url-highlighter'     atload'use url-hl.atload'     @ascii-soup/zsh-url-highlighter

# ==================================================================================================
# -- rust compiler environment ---------------------------------------------------------------------
# ==================================================================================================
zi default-ice                                                                                     \
--clear                                                                                            \
--quiet                                                                                            \
  lucid                                                                                            \
  light-mode                                                                                       \
  wait'1'                                                                                          \
  id-as'rust'

# Installation of Rust compiler environment via the z-a-rust annex
zi for id-as'rust' rustup as=null sbin="bin/*" atload='use rust.atload' @zdharma-continuum/null

# zi for id-as'sd' rustup cargo'!sd' @chmln/sd
# zi for id-as'lsd' rustup cargo'!lsd' @zdharma-continuum/null
# zi for id-as'delta' rustup cargo'!delta' @zdharma-continuum/null

#zi atclone'./install --user' "@BartSte/fzf-help"
#zi nocompletions compile"*.zsh" atload_use atinit_use hlissner/zsh-autopair

# ==================================================================================================
# -- form and function enhancers -------------------------------------------------------------------
# ==================================================================================================
zi default-ice                                                                                     \
--clear                                                                                            \
--quiet                                                                                            \
  lucid                                                                                            \
  light-mode                                                                                       \
  wait'0'

# -- zsh-syntax-highlighting, zsh-completions, zsh-autosuggestions --
zi for                                                                                             \
  id-as'f-s-h' atinit'use f-s-h.atload'             @zdharma-continuum/fast-syntax-highlighting    \
  id-as'zsh-completions' blockf                     @zsh-users/zsh-completions                     \
  id-as'autosuggest' atload'use autosuggest.atload' @zsh-users/zsh-autosuggestions

# -- powerlevel10k --
[[ ! -f "$XDG_CONFIG_HOME/p10k.zsh" ]] || source "$XDG_CONFIG_HOME/p10k.zsh"