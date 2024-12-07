#! /usr/bin/env zsh

# ~~ prompt and zinit prep ---------------------------------------------------------------------------------------------
p10k_instant_prompt
clone-if-missing zdharma-continuum/zinit.git $ZINIT[HOME_DIR]
source-and-autoload $ZINIT[HOME_DIR]/zinit.git/zinit.zsh _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ~~ enhancing zinit ---------------------------------------------------------------------------------------------------
zi id-as lucid light-mode for                                                                                          \
   atload'use --atload zinit-annex-default-ice'                                                                        \
   @zdharma-continuum/zinit-annex-{default-ice,bin-gem-node,binary-symlink,patch-dl,link-man,linkman,rust}

# ~~ tree inwt----------------------------------------------------------------------------------------------------------
zi wait lman id-as depth'3' nocompile sbin'bin/brew' atclone'use --atclone brew'  atload'use --atload brew' for        \
   @homebrew/brew

zi lucid light-mode depth'1' for @romkatv/powerlevel10k
# ~~ sourcing zsh configs as snippets ----------------------------------------------------------------------------------
zi wait id-as is-snippet for @$ZDOTDIR/{autoload,options,keybinds,aliases,completions}.zsh

# ~~ oh-my-zsh snippets ------------------------------------------------------------------------------------------------
zi wait is-snippet id-as'oh-my-snippets' for                                                                           \
   OMZL::{theme-and-appearance,key-bindings,correction,compfix,history}.zsh                                            \
   OMZP::{colorize,extract,urltools,brew,git,cp,grc}

# ~~ zinit tweaks ------------------------------------------------------------------------------------------------------
zi wait id-as atclone"use --atclone zsh-smartcache" for                                                                \
   atclone"use --atclone zsh-smartcache"                                                                               \
   @QuarticCat/zsh-smartcache

# ~~ russells cargo ---------------------------------------------------------------------------------------------------
zi wait lman rustup binary sbin'bin/*' id-as'cargo-apps' for                                                          \
   atload'use --atload rust'                                                                                          \
   cargo'cargo-edit;cargo-outdated;cargo-tree;cargo-update;cargo-expand;cargo-modules;
         cargo-audit;cargo-clone;lsd;sd;tre;tlrc;rm-improved;choose;mcfly;mchdir;skim'                                \
   @zdharma-continuum/null

# ~~ rub a dub dub there's gits in my hubs -----------------------------------------------------------------------------
zi wait from'gh-r' lman sbin id-as for                                                                                 \
sbin'nvim*/bin/nvim->nvim' atclone'use --atclone neovim' @neovim/neovim                                                \
sbin'**/sh*->shfmt'                                      @mvdan/sh                                                     \
sbin'**/diff-so-fancy'                                   @so-fancy/diff-so-fancy                                       \
sbin'*/shellcheck'                                       @koalaman/shellcheck                                          \
sbin'*/tree-sitter'  nocompile                           @tree-sitter/tree-sitter

# ~~ ineedz a mans -----------------------------------------------------------------------------------------------------
zi wait lbin lman id-as binary from'gh-r' atpull'%atclone' for                                                         \
   atclone'use --atclone dog'      @ogham/dog                                                                          \
   atclone'use --atclone just'     @casey/just                                                                         \
   atclone'use --atclone fd'       @sharkdp/fd                                                                         \
   atclone'use --atclone fx'       @antonmedv/fx                                                                       \
   atclone'use --atclone ripgrep'  @BurntSushi/ripgrep

zi binary lbin id-as wait for                                                                                          \
atinit'use --atinit zoxide'  lman'*/**.1' @ajeetdsouza/zoxide                                                          \
sbin'bin/zsweep'                          @zdharma-continuum/zsh-sweep

#-- pop, pop, fzf, fzf oh wut a relief itis ----------------------------------------------------------------------------
zi id-as wait for                                                                                                      \
pack'bgn+keys'                           @fzf                                                                          \
atload'use --atload fzf-tab'             @Aloxaf/fzf-tab
# atload'use --atload fzf-tab-completion'  @lincheney/fzf-tab-completion

# -- regular packages --------------------------------------------------------------------------------------------------
zi wait id-as for                                                                                                      \
pack                                                                      @dircolors-material                          \
pack                                                                      @ls_colors

# -- prompt up the jam, prompt it up,p-p-prompt it up ------------------------------------------------------------------
zi wait id-as for                                                                                                      \
   atinit'use --atinit fast-syntax-highlighting'                                                                       \
   @zdharma-continuum/fast-syntax-highlighting                                                                         \
   blockf                                                                                                              \
   atload'use --atload zsh-completions'                                                                                \
   atpull'use --atpull zsh-completions'                                                                                \
   @zsh-users/zsh-completions                                                                                          \
   atinit'use --atinit zsh-autosuggestions'                                                                            \
   atload'use --atload zsh-autosuggestions'                                                                            \
   @zsh-users/zsh-autosuggestions

# source if files exist``
[[ ! -f "$DOT_CONFIG_HOME/.iterm2_shell_integration.zsh" ]] || source "$DOT_CONFIG_HOME/.iterm2_shell_integration.zsh"
[[ ! -f "$DOT_CONFIG_HOME/.p10k.zsh" ]] || source "$DOT_CONFIG_HOME/.p10k.zsh"


