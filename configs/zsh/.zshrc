#!/usr/bin/env zsh

# -- power10k instant prompt ----------------------------------------------------
local IPATH="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r $IPATH ]] && source $IPATH

#--- zinit load ----------------------------------------------------------------
local ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && \
git clone "https://github.com/zdharma-continuum/zinit.git" "$ZINIT_HOME"
source "$ZINIT_HOME/zinit.zsh"

# ==============================================================================
# -- local variables -----------------------------------------------------------
# ==============================================================================
Z() { local W="$1"; shift; zinit id-as lucid wait"$W" for ${(j: :)@} }

zinit_init() { zinit creinstall ${ZSH}/completions }

# ==============================================================================
# -- annexes -------------------------------------------------------------------
# ==============================================================================
zinit for id-as'gem-node'      @zdharma-continuum/zinit-annex-bin-gem-node     \
          id-as'bin-symlink'   @zdharma-continuum/zinit-annex-binary-symlink   \
          id-as'default-ice'   @zdharma-continuum/zinit-annex-default-ice      \
          id-as'patch-dl'      @zdharma-continuum/zinit-annex-patch-dl         \
          id-as'rust'          @zdharma-continuum/zinit-annex-rust

# "@zdharma-continuum/zinit-annex-submods" 
# "@zdharma-continuum/zinit-annex-link-man"
# "@zdharma-continuum/zinit-annex-man"

# ==============================================================================
# -- zsh configs ---------------------------------------------------------------
# ==============================================================================
zinit default-ice                                                              \
--clear                                                                        \
--quiet                                                                        \
  lucid                                                                        \
  wait'0'                                                                      \
  light-mode

zinit for id-as'paths'       is-snippet '@$ZDOTDIR/paths.zsh'                  \
          id-as'autoload'    is-snippet '@$ZDOTDIR/autoload.zsh'               \
          id-as'options'     is-snippet '@$ZDOTDIR/options.zsh'                \
          id-as'keybind'     is-snippet '@$ZDOTDIR/keybind.zsh'                \
          id-as'aliases'     is-snippet '@$ZDOTDIR/aliases.zsh'                \
          id-as'snippets'    is-snippet '@$ZDOTDIR/snippets.zsh'               \
          id-as'completions' is-snippet '@$ZDOTDIR/completions.zsh'
          
# ==============================================================================
# -- github packages -----------------------------------------------------------
# ==============================================================================
zinit default-ice                                                              \
--clear                                                                        \
--quiet                                                                        \
  lucid                                                                        \
  wait'0'                                                                      \
  from'gh-r'                                                                   \
  light-mode 
 
zinit for id-as'lazygit' sbin'lazygit -> lazygit'      @jesseduffield/lazygit  \
          id-as'lemme'   sbin'lemmeknow* -> lemme'     @swanandx/lemmeknow     \
          id-as'rg'      sbin'**/rg -> rg'             @BurntSushi/ripgrep     \
          id-as'glow'    sbin'**/glow'                 @charmbracelet/glow     \
          id-as'nvim'    sbin'**/nvim -> nvim'         @neovim/neovim          \
          id-as'mcfly'   sbin'mcfly* -> mcfly'         @cantino/mcfly          \
          id-as'deno'    sbin'* -> deno'               @denoland/deno          \
          id-as"bat"     sbin'**/bat -> bat'           @sharkdp/bat            \
          id-as'fx'      sbin'fx* -> fx'               antonmedv/fx            \
          id-as'assh'    sbin'assh* -> assh'           @moul/assh              \
          id-as'tree'    sbin'tre* -> tree'            @dduan/tre              \
          id-as'fd'      sbin'**/fd -> fd'             @sharkdp/fd             \
          id-as'lsd'     sbin'lsd-*/lsd'               @lsd-rs/lsd             \
          id-as'sd'      sbin'sd* -> sd'               @chmln/sd               \
          id-as'shfmt'   sbin'**/sh* -> shfmt'         @mvdan/sh               \
          id-as'gh'      sbin'gh_*/bin/gh* -> gh'      @cli/cli                \
          id-as'shcheck' sbin"*/shellcheck -> shcheck" @koalaman/shellcheck
        
# -- zoxide: "smarter jump enhancer for cd" ------------------------------------
zinit for id-as'zoxide'                                                        \
          sbin"zoxide -> zoxide"                                               \
          atclone"./zoxide init zsh > init.zsh"                                \
          atpull"%atclone"                                                     \
          src"init.zsh"                                                        \
          nocompile'!'                                                         \
          @ajeetdsouza/zoxide   
          
# ==============================================================================
# -- other releases ------------------------------------------------------------
# ==============================================================================
zinit default-ice                                                              \
--clear                                                                        \
--quiet                                                                        \
  id-as                                                                        \
  lucid                                                                        \
  wait'0'                                                                      \
  light-mode 

zinit for id-as'zsh-async'     @mafredri/zsh-async                             \
          id-as'zsh-dot-up'    @toku-sa-n/zsh-dot-up                           \
          id-as'fzf-tab'       @Aloxaf/fzf-tab                                 \
          id-as'zui'           @z-shell/zui                                    \
          id-as'zsh-lint'      @z-shell/zsh-lint                               \
          id-as'zsh-sweep'     @zdharma-continuum/zsh-sweep                    \
          id-as'safe-rm'       @mattmc3/zsh-safe-rm                            \
          id-as'multiple-dots' @momo-lab/zsh-replace-multiple-dots             \
          id-as'zman'          @mattmc3/zman

# ==============================================================================
# -- fzf -----------------------------------------------------------------------
# ==============================================================================
zinit default-ice                                                              \
--clear                                                                        \
--quiet                                                                        \
  lucid                                                                        \
  light-mode                                                                   \
  wait'0'

zinit for id-as'fzf'        pack'bgn-binary+keys'           @fzf               \
          id-as'dircolors'  pack                            @dircolors-material\
          id-as'ls_colors'  pack                            @ls_colors         \
          id-as'shellsence' pack param='inshellisense → is' @any-node

zinit for id-as'p10k'                          depth'1' @romkatv/powerlevel10k \
          id-as'brew'   sbin'bin/brew -> brew' depth'3' @homebrew/brew         \
          id-as'zeno'   sbin'**/zeno -> zeno'  depth'1' @yuki-yano/zeno.zsh    \
          id-as'delta'  sbin'**/delta -> delta'         @dandavison/delta      \
          id-as'tldr'   sbin'tealdeer* -> tldr'         @dbrgn/tealdeer        

zinit for id-as'gfuzzy' sbin'bin/git-fuzzy -> gfuzzy' blockf @bigH/git-fuzzy


#zinit "@Aloxaf/fzf-tab"
#zinit atclone'./install --user' "@BartSte/fzf-help"
#zinit nocompletions compile"*.zsh" atload_hook atinit_hook hlissner/zsh-autopair

# -- powerlevel10k -------------------------------------------------------------
[[ ! -f '$DOTFILES[CONFIGS]/p10k.zsh' ]] || source '$DOTFILES[CONFIGS]/p10k.zsh'