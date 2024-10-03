#!/usr/bin/env zsh

# -- power10k instant prompt ----------------------------------------------------------------------
local IPATH="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r $IPATH ]] && source $IPATH

# makes sure zinit is installed, sourced, and additional ices added
initialize_zinit

# =================================================================================================
# -- zsh configs ----------------------------------------------------------------------------------
# =================================================================================================
zinit default-ice                                                                                 \
--clear                                                                                           \
--quiet                                                                                           \
  lucid                                                                                           \
  wait'0'                                                                                         \
  light-mode                    

zinit for id-as'autoload'    is-snippet '@$ZDOTDIR/autoload.zsh'                                  \
          id-as'options'     is-snippet '@$ZDOTDIR/options.zsh'                                   \
          id-as'keybind'     is-snippet '@$ZDOTDIR/keybind.zsh'                                   \
          id-as'aliases'     is-snippet '@$ZDOTDIR/aliases.zsh'                                   \
          id-as'snippets'    is-snippet '@$ZDOTDIR/snippets.zsh'                                  \
          id-as'completions' is-snippet '@$ZDOTDIR/completions.zsh'
          
# =================================================================================================
# -- github packages ------------------------------------------------------------------------------
# =================================================================================================
zinit default-ice                                                                                 \
--clear                                                                                           \
--quiet                                                                                           \
  lucid                                                                                           \
  wait'0'                                                                                         \
  from'gh-r'                                                                                      \
  light-mode 
 
zinit for id-as'lazygit' sbin'lazygit -> lazygit'      @jesseduffield/lazygit                     \
          id-as'lemme'   sbin'lemmeknow* -> lemme'     @swanandx/lemmeknow                        \
          id-as'rg'      sbin'**/rg -> rg'             @BurntSushi/ripgrep                        \
          id-as'glow'    sbin'**/glow'                 @charmbracelet/glow                        \
          id-as'nvim'    sbin'**/nvim -> nvim'         @neovim/neovim                             \
          id-as'mcfly'   sbin'mcfly* -> mcfly'         @cantino/mcfly                             \
          id-as'deno'    sbin'* -> deno'               @denoland/deno                             \
          id-as"bat"     sbin'**/bat -> bat'           @sharkdp/bat                               \
          id-as'fx'      sbin'fx* -> fx'               antonmedv/fx                               \
          id-as'assh'    sbin'assh* -> assh'           @moul/assh                                 \
          id-as'tree'    sbin'tre* -> tree'            @dduan/tre                                 \
          id-as'fd'      sbin'**/fd -> fd'             @sharkdp/fd                                \
          id-as'lsd'     sbin'lsd-*/lsd'               @lsd-rs/lsd                                \
          id-as'sd'      sbin'sd* -> sd'               @chmln/sd                                  \
          id-as'shfmt'   sbin'**/sh* -> shfmt'         @mvdan/sh                                  \
          id-as'gh'      sbin'gh_*/bin/gh* -> gh'      @cli/cli                                   \
          id-as'shcheck' sbin"*/shellcheck -> shcheck" @koalaman/shellcheck
        
# -- zoxide: "smarter jump enhancer for cd" -------------------------------------------------------
zinit for id-as'zoxide'                                                                           \
          sbin"zoxide -> zoxide"                                                                  \
          atclone"./zoxide init zsh > init.zsh"                                                   \
          atpull"%atclone"                                                                        \
          src"init.zsh"                                                                           \
          nocompile'!'                                                                            \
          @ajeetdsouza/zoxide   
          
# =================================================================================================
# -- other releases -------------------------------------------------------------------------------
# =================================================================================================
zinit default-ice                                                                                 \
--clear                                                                                           \
--quiet                                                                                           \
  id-as                                                                                           \
  lucid                                                                                           \
  wait'0'                                                                                         \
  light-mode 

zinit for id-as'zsh-async'     @mafredri/zsh-async                                                \
          id-as'zsh-dot-up'    @toku-sa-n/zsh-dot-up                                              \
          id-as'fzf-tab'       @Aloxaf/fzf-tab                                                    \
          id-as'zui'           @z-shell/zui                                                       \
          id-as'zsh-lint'      @z-shell/zsh-lint                                                  \
          id-as'zsh-sweep'     @zdharma-continuum/zsh-sweep                                       \
          id-as'safe-rm'       @mattmc3/zsh-safe-rm                                               \
          id-as'multiple-dots' @momo-lab/zsh-replace-multiple-dots                                \
          id-as'zman'          @mattmc3/zman

# =================================================================================================
# -- non-gh-rel packages --------------------------------------------------------------------------
# =================================================================================================
zinit default-ice                                                                                 \
--clear                                                                                           \
--quiet                                                                                           \
  lucid                                                                                           \
  light-mode                                                                                      \
  wait'0'

zinit for id-as'fzf'        pack'bgn-binary+keys'                 @fzf                            \
          id-as'dircolors'  pack                                  @dircolors-material             \
          id-as'ls_colors'  pack                                  @ls_colors                      \
          id-as'shellsence' pack param='inshellisense → is'       @any-node

zinit for id-as'p10k'                                   depth'1'  @romkatv/powerlevel10k          \
          id-as'brew'     sbin'bin/brew -> brew'        depth'3'  @homebrew/brew                  \
          id-as'zeno'     sbin'**/zeno -> zeno'         depth'1'  @yuki-yano/zeno.zsh             \
          id-as'delta'    sbin'delta -> delta'                 @dandavison/delta               \
          id-as'tldr'     sbin'tealdeer* -> tldr'                 @dbrgn/tealdeer                 \
          id-as'gfuzzy'   sbin'bin/git-fuzzy -> gfuzzy' blockf    @bigH/git-fuzzy                 \
          id-as'url-hl'   sbin'url/url*'                          @ascii-soup/zsh-url-highlighter \


#zinit atclone'./install --user' "@BartSte/fzf-help"
#zinit nocompletions compile"*.zsh" atload_hook atinit_hook hlissner/zsh-autopair

# =================================================================================================
# -- form and function enhancers ------------------------------------------------------------------
# =================================================================================================
zinit default-ice                                                                                 \
--clear                                                                                           \
--quiet                                                                                           \
  lucid                                                                                           \
  light-mode                                                                                      \
  wait'0'

# -- zsh-syntax-highlighting --
zinit for id-as'fast-syntax-highlighting'                                                         \
          atinit'use fast-syntax-highlighting.atload'                                             \
          @zdharma-continuum/fast-syntax-highlighting

# -- zsh-completions --
zinit for id-as'zsh-completions' blockf @zsh-users/zsh-completions

# -- zsh-autosuggestions --
zinit for id-as'zsh-autosuggestions'                                                              \
          atload'use zsh-autosuggestions.atload'                                                  \
          @zsh-users/zsh-autosuggestions

# -- powerlevel10k --
[[ ! -f '$XDG_CONFIG_HOME/p10k.zsh' ]] || source '$XDG_CONFIG_HOME/p10k.zsh'
