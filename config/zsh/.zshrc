#! /usr/bin/env zsh

# ~~ p10kand zinit init ------------------------------------------------------------------------------------------------
p10k_instant_prompt
clone-if-missing zdharma-continuum/zinit.git $ZINIT[HOME_DIR]
source-and-autoload $ZINIT[HOME_DIR]/zinit.git/zinit.zsh _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ~~ plugins -----------------------------------------------------------------------------------------------------------
# -- annexes --
zi id-as lucid light-mode for @zdharma-continuum/zinit-annex-{bin-gem-node,binary-symlink,patch-dl,link-man,linkman}

# -- dependencies --
zi id-as lman lucid light-mode completions for                                                                         \
   depth'1' @romkatv/powerlevel10k                                                                                     \
   wait atload'use --atload zsh-smartcache' @QuarticCat/zsh-smartcache

# -- zinit-packages --
zi id-as wait lman lucid light-mode pack for                                                                           \
   @dircolors-material                                                                                                 \
   @ls_colors

# -- github-releases --
zi id-as wait completions from'gh-r' atpull'%atclone' light-mode lbin lman lucid binary for                            \
                                                             lman'autocomplete/_lsd'      @lsd-rs/lsd                  \
   atload'use --atload tre'                                                               @tre/dduan/tre               \
   atload'use --atload fx'                                   lbin'fx_*->fx'               @antonmedv/fx                \
   atclone'use --atclone nvim'                               lbin'**/nvim'                @neovim/neovim               \
   atclone'use --atclone dog'                                                             @ogham/dog                   \
   atclone'use --atclone just'                                                            @casey/just                  \
   atclone'use --atclone fd'     atload'use --atload fd'     lbin'fd/fd'                  @sharkdp/fd                  \
   atclone'use --atclone bat'    atload'use --atload bat'    lbin'bat-*/bat'              @sharkdp/bat                 \
                                                             lbin                         @ClementTsang/bottom         \
                                                             lbin'bin/*'                  @eth-p/bat-extras            \
   atclone'use --atclone rg'     atload'use --atload rg'     lbin'ripgrep-*/rg'           @BurntSushi/ripgrep          \
   atclone'use --atclone delta'  atload'use --atload delta'  lbin'*/delta'                @dandavison/delta            \
   atclone'use --atclone zoxide' atload'use --atload zoxide' lbin'zoxide'  lman'*/**.1'   @ajeetdsouza/zoxide          \
                                                             lbin'rush/rush'              @shenwei356/rush             \
   atclone'use --atclone glow'                                                            @charmbracelet/glow          \
   atclone'use --atclone moar'                               lbin'moar-*->moar'           @walles/moar                 \
   atclone'use --atclone sd'                                                              @chmln/sd                    \
   atclone'use --atclone zeno'                                                            @orf/gping
   

# -- non-github-releases --
zi id-as wait binary light-mode lbin lman lucid for                                                                    \
   atload'use --atload brew' atclone'use --atclone brew' depth'3' nocompile sbin'*/brew' @homebrew/brew                \
   atload'use --atload fzf-tab'                                                          @Aloxaf/fzf-tab               \
   atload'use --atload fzf-tab-completion'                                               @lincheney/fzf-tab-completion \
   atload'use --atload git-ignore' pick'init.zsh' lbin'bin/git-ignore'                   @laggardkernel/git-ignore     \
                                                  lbin'bin/zsweep'                       @zdharma-continuum/zsh-sweep  \
                                                  lbin'**/sh*V->shfmt'                   @mvdan/sh                     \
                                                  lbin'shellcheck*/shellcheck'           @koalaman/shellcheck

# ~~ snippets loading --------------------------------------------------------------------------------------------------
zi id-as wait"2" lucid is-snippet for                                                                                  \
   @$ZDOTDIR/{autoload,options,keybinds,aliases}.zsh                                                                   \
   OMZL::{key-bindings,correction,completion,compfix,git,grep}.zsh                                                      \
   OMZP::{colorize,extract,urltools,brew,cp,grc,git,fzf}

# ~~ completions -------------------------------------------------------------------------------------------------------
zi wait pack atload=+"zicompinit; zicdreplay" for system-completions
zi id-as wait lucid light-mode lman lbin binary from'gh-r' for @rsteube/lazycomplete
zi id-as wait'1' lucid is-snippet for @$ZDOTDIR/completions.zsh

zi id-as wait'1' lman lucid light-mode for                                                                             \
   nocompletions nocompile completions id-as'clarketm-completions'                @clarketm/zsh-completions            \
                                                                                  @lincheney/fzf-tab-completion        \
                                                                                  @chitoku-k/fzf-zsh-completions       \
   atload'use --atload zsh-fancy-completions'                                     @z-shell/zsh-fancy-completions       \
                                                                                  @jnooree/zoxide-zsh-completion       \
   atload='use --atload bash-completions-fallback' nocd depth'1'                  @3v1n0/zsh-bash-completions-fallback \
   id-as'sainhe' atload'use --atload sainhe' atpull'use --atpull sainhe' depth'1' @sainnhe/zsh-completions
   
# ~~ core --------------------------------------------------------------------------------------------------------------
zi wait id-as lman lucid light-mode for                                                                                \
   atinit'use --atinit fast-syntax-highlighting'                                                                       \
     @zdharma-continuum/fast-syntax-highlighting                                                                       \
   blockf                                                                                                              \
   atload'use --atload zsh-completions'                                                                                \
   atpull'use --atpull zsh-completions'                                                                                \
     @zsh-users/zsh-completions                                                                                        \
   atinit'use --atinit zsh-autosuggestions'                                                                            \
   atload'use --atload zsh-autosuggestions'                                                                            \
     @zsh-users/zsh-autosuggestions

# source if files exist
[[ ! -f "$DOT_CONFIG_HOME/iterm2_shell_integration.zsh" ]] || source "$DOT_CONFIG_HOME/iterm2_shell_integration.zsh"
[[ ! -f "$DOT_CONFIG_HOME/p10k/p10k.zsh" ]] || source "$DOT_CONFIG_HOME/p10k/p10k.zsh"
