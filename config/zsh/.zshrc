#!/usr/bin/env zsh

# initializes the power10k instant prompt
p10k_instant_prompt``

# check and install zinit if not installed
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

zinit for id-as'autoload'       is-snippet                           @$ZDOTDIR/autoload.zsh       \
          id-as'options'        is-snippet                           @$ZDOTDIR/options.zsh        \
          id-as'keybind'        is-snippet                           @$ZDOTDIR/keybind.zsh        \
          id-as'aliases'        is-snippet                           @$ZDOTDIR/aliases.zsh        \
          id-as'completions'    is-snippet                           @$ZDOTDIR/completions.zsh

# =================================================================================================
# -- omz plugins and libraries --------------------------------------------------------------------
# =================================================================================================
zinit for OMZL::completion.zsh                                                                    \
          OMZL::compfix.zsh                                                                       \
          OMZL::correction.zsh                                                                    \
          OMZL::history.zsh                                                                       \
          OMZL::theme-and-appearance.zsh                                                          \
          OMZP::brew                                                                              \
          OMZP::gnu-util                                                                          \
          OMZP::colorize                                                                          \
          OMZP::web-search                                                                        \
          OMZP::ssh                                                                               \
          OMZP::pip                                                                               \
          OMZP::cp                                                                                \
          OMZP::grc                                                                               \
          OMZP::gitfast                                                                           \
          OMZP::urltools                                                                          \
          atload'hook magic-enter.atload.zsh'                                                     \
          OMZP::magic-enter                                               

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

zinit for id-as'lazygit'     sbin'lazygit -> lazygit'                   @jesseduffield/lazygit    \
          id-as'lemmeknow'   sbin'lemmeknow* -> lemmeknow'              @swanandx/lemmeknow       \
          id-as'rg'          sbin'**/rg -> rg' atload'use rg.atload'    @BurntSushi/ripgrep       \
          id-as'glow'        sbin'**/glow'                              @charmbracelet/glow       \
          id-as'nvim'        sbin'**/nvim -> nvim'                      @neovim/neovim            \
          id-as'mcfly'       sbin'mcfly* -> mcfly'                      @cantino/mcfly            \
          id-as'deno'        sbin'* -> deno'                            @denoland/deno            \
          id-as"bat"         sbin'**/bat -> bat' atload'use bat.atload' @sharkdp/bat              \
          id-as'fx'          sbin'fx* -> fx'                            antonmedv/fx              \
          id-as'assh'        sbin'assh* -> assh'                        @moul/assh                \
          id-as'tree'        sbin'tre* -> tree'                         @dduan/tre                \
          id-as'fd'          sbin'**/fd -> fd' atload'use fd.atload'    @sharkdp/fd               \
          id-as'lsd'         sbin'lsd-*/lsd'                            @lsd-rs/lsd               \
          id-as'sd'          sbin'sd* -> sd'                            @chmln/sd                 \
          id-as'shfmt'       sbin'**/sh* -> shfmt'                      @mvdan/sh                 \
          id-as'gh'          sbin'gh_*/bin/gh* -> gh'                   @cli/cli                  \
          id-as'shellcheck'  sbin'*/shellcheck -> shellcheck'           @koalaman/shellcheck      \
          id-as'fastfetch'   sbin'**/fastfetch -> fastfetch'            @fastfetch-cli/fastfetch  \
          id-as'delta'       sbin'delta -> delta'                       @dandavison/delta         \
          id-as'tldr'        sbin'tealdeer* -> tldr'                    @dbrgn/tealdeer
        
# -- zoxide: "smarter jump enhancer for cd" --
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

zinit for id-as'zsh-async'                           @mafredri/zsh-async                          \
          id-as'zsh-dot-up'                          @toku-sa-n/zsh-dot-up                        \
          id-as'fzf-tab'                             @Aloxaf/fzf-tab                              \
          id-as'zui'                                 @z-shell/zui                                 \
          id-as'zsh-lint'                            @z-shell/zsh-lint                            \
          id-as'zsh-sweep'                           @zdharma-continuum/zsh-sweep                 \
          id-as'safe-rm'                             @mattmc3/zsh-safe-rm                         \
          id-as'multiple-dots'                       @momo-lab/zsh-replace-multiple-dots          \
          id-as'zman'                                @mattmc3/zman

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

zinit for id-as'p10k'                               depth'1'      @romkatv/powerlevel10k          \
          id-as'brew'       sbin'bin/brew -> brew'  depth'3'      @homebrew/brew                  \
          id-as'zeno'       sbin'**/zeno -> zeno'   depth'1'      @yuki-yano/zeno.zsh             \
          
          
          id-as'git-fuzzy'  sbin'bin/git-fuzzy -> gfuzzy' blockf  @bigH/git-fuzzy                 \
          id-as'url-hl'     sbin'url/url* -> url-highlighter'     atload'use url-hl.atload' @ascii-soup/zsh-url-highlighter


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

# -- zsh-syntax-highlighting, zsh-completions, zsh-autosuggestions --
zinit for id-as'f-s-h' atinit'use f-s-h.atload'  @zdharma-continuum/fast-syntax-highlighting      \
          id-as'zsh-completions' blockf                           @zsh-users/zsh-completions      \
          id-as'autosuggest' atload'use autosuggest.atload'   @zsh-users/zsh-autosuggestions

# -- powerlevel10k --
[[ ! -f '$XDG_CONFIG_HOME/p10k.zsh' ]] || source '$XDG_CONFIG_HOME/p10k.zsh'
