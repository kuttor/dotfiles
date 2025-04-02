#! /usr/bin/env zsh

# ~~ p10kand zinit init ------------------------------------------------------------------------------------------------
p10k_instant_prompt
#confirm brew --or install_homebrew
source /opt/homebrew/opt/zinit/zinit.zsh
(( ${+_comps} )) && _comps[zinit]=_zinit

# ~~ plugins -----------------------------------------------------------------------------------------------------------
# -- annexes --
zi id-as lucid light-mode for                                                                                          \
   @zdharma-continuum/zinit-annex-{bin-gem-node,binary-symlink,patch-dl,link-man,linkman}

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
   atclone'use --atclone fx'     atload'use --atload fx'     lbin'fx_*->fx'               @antonmedv/fx                \
   atclone'use --atclone nvim'                               lbin'**/nvim'                @neovim/neovim               \
   atclone'use --atclone dog'                                                             @ogham/dog                   \
   atclone'use --atclone fd'     atload'use --atload fd'     lbin'fd/fd'                  @sharkdp/fd                  \
   atclone'use --atclone bat'    atload'use --atload bat'    lbin'bat-*/bat'              @sharkdp/bat                 \
                                                             lbin'bin/*'                  @eth-p/bat-extras            \
   atclone'use --atclone rg'     atload'use --atload rg'     lbin'ripgrep-*/rg'           @BurntSushi/ripgrep          \
   atclone'use --atclone glow'                                                            @charmbracelet/glow          \
   atclone'use --atclone moar'                               lbin'moar-*->moar'           @walles/moar                 \
   atclone'use --atclone sd'                                                              @chmln/sd                    \
   atclone'use --atclone zeno'                                                            @orf/gping                   \
   atclone'use --atclone mc'                                 lbin'mc-*->mc'               @thewh1teagle/mc             \
   atclone'use --atclone ov'     atload'use --atload ov'     lbin'ov-*->ov'               @noborus/ov

# -- non-github-releases --
zi id-as wait binary light-mode lbin lman lucid for                                                                    \
   atload'use --atload fzf-tab'                                                          @Aloxaf/fzf-tab               \
   atload'use --atload fzf-tab-completion'                                               @lincheney/fzf-tab-completion \
   atload'use --atload git-ignore' pick'init.zsh' lbin'bin/git-ignore'                   @laggardkernel/git-ignore     \
                                                  lbin'bin/zsweep'                       @zdharma-continuum/zsh-sweep  \
                                                  lbin'**/sh*V->shfmt'                   @mvdan/sh                     \
                                                  lbin'shellcheck*/shellcheck'           @koalaman/shellcheck

# ~~ snippets loading --------------------------------------------------------------------------------------------------
zi id-as wait'2' lucid is-snippet for                                                                                  \
   @$ZDOTDIR/{autoload,options,keybinds,aliases}.zsh                                                                   \
   OMZL::{key-bindings,correction,completion,compfix,git,grep}.zsh                                                     \
   OMZP::{colorize,extract,urltools,brew,cp,grc,git,fzf,thefuck}

# ~~ completions -------------------------------------------------------------------------------------------------------
zi id-as wait lucid light-mode lman lbin binary from'gh-r' for @rsteube/lazycomplete
zi id-as wait'1' lucid is-snippet for @$ZDOTDIR/completions.zsh

zi id-as wait'1' lman lucid light-mode for                                                                             \
   nocompletions nocompile completions id-as'clarketm-completions'                @clarketm/zsh-completions            \
                                                                                  @lincheney/fzf-tab-completion        \
                                                                                  @chitoku-k/fzf-zsh-completions       \
   atload'use --atload zsh-fancy-completions'                                     @z-shell/zsh-fancy-completions       \
   atload'use --atload bash-completions-fallback' nocd depth'1'                   @3v1n0/zsh-bash-completions-fallback

# ~~ core --------------------------------------------------------------------------------------------------------------
zi wait id-as lman lucid light-mode for                                                                                \
   atinit'use --atinit fast-syntax-highlighting'                           @zdharma-continuum/fast-syntax-highlighting \
   atload'use --atload zsh-completions' atpull'use --atpull zsh-completions' blockf     @zsh-users/zsh-completions     \
   atinit'use --atinit zsh-autosuggestions' atload'use --atload zsh-autosuggestions'    @zsh-users/zsh-autosuggestions

# source if files exist
[[ ! -f "$DOT_CONFIG_HOME/iterm2_shell_integration.zsh" ]] || source "$DOT_CONFIG_HOME/iterm2_shell_integration.zsh"
[[ ! -f "$DOT_CONFIG_HOME/p10k/p10k.zsh" ]] || source "$DOT_CONFIG_HOME/p10k/p10k.zsh"
source $CARGO_HOME/env

# Created by `pipx` on 2025-02-28 00:19:16
export PATH="$PATH:/Users/akuttor/.local/bin"
