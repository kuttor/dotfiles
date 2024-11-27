#! /usr/bin/env zsh

# -- prompt and zinit prep ---------------------------------------------------------------------------------------------
p10k_instant_prompt
clone-if-missing zdharma-continuum/zinit.git $ZINIT[HOME_DIR]
source-and-autoload $ZINIT[HOME_DIR]/zinit.git/zinit.zsh _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# -- panic and the annex -----------------------------------------------------------------------------------------------
zi id-as'auto' lucid light-mode for                                                                                    \
@zdharma-continuum/zinit-annex-{bin-gem-node,binary-symlink,default-ice,patch-dl,link-man,rust,man}

# -- default-ice -------------------------------------------------------------------------------------------------------
zi default-ice --clear --quiet lucid light-mode wait'0' id-as'auto'

# -- con-air, con-artist, con-man and now con-fig ----------------------------------------------------------------------
zi id-as'zsh-configs' is-snippet for@$ZDOTDIR/{autoload,options,keybind,aliases,completions}.zsh

# -- manpage renovations -----------------------------------------------------------------------------------------------
zi for                                                                                                                 \
pack @asciidoctor                                                                                                      \
@mattmc3/zman

# -rustup - fargo cargo ------------------------------------------------------------------------------------------------
zi rustup id-as'auto'for                                                                                               \
cargo'lsd;sd;tre;tlrc;rm-improved;choose;mcfly'                                                                        \
lbin'bin/(lsd|sd|tre|tlrc|rip|rust*|carg*|choose|mcfly)'                                                               \
atload'use tre.atload;use lsd.atload; use rust.atload'                                                                 \
@zdharma-continuum/null

# -- omz plugins and libraries -----------------------------------------------------------------------------------------
zi id-as'Oh-my-snippets' for                                                                                           \
OMZL::{theme-and-appearance,key-bindings,correction,compfix,history}.zsh                                               \
OMZP::{colorize,urltools,brew,git,cp,grc}                                                                              \
  atload'use magic-enter.atload'                                                                                       \
OMZP::magic-enter

# -- rub a dub dub there's gits in my hubs -----------------------------------------------------------------------------
zi from'gh-r' id-as'auto' for                                                                                          \
sbin'lemmeknow*->lemmeknow'                              @swanandx/lemmeknow                                           \
sbin'gh_*/bin/gh*->gh'                                   @cli/cli                                                      \
sbin'**/glow->glow'                                      @charmbracelet/glow                                           \
sbin'nvim*/bin/nvim->nvim'  atclone'use neovim.atclone'  @neovim/neovim                                                \
sbin'mcfly*->mcfly'                                      @cantino/mcfly                                                \
sbin'*->deno'                                            @denoland/deno                                                \
sbin'assh*->assh'                                        @moul/assh                                                    \
sbin'**/sh*->shfmt'                                      @mvdan/sh                                                     \
sbin'direnv*->direnv'                                    @direnv/direnv                                                \
sbin'**/diff-so-fancy->diff-so-fancy'                    @so-fancy/diff-so-fancy                                       \
sbin'*/shellcheck->shellcheck'                           @koalaman/shellcheck                                          \
sbin'*->tree-sitter->tree-sitter'  nocompile             @tree-sitter/tree-sitter                                      \
sbin'antidot*->antidot' atload'use antidot.atload'       @doron-cohen/antidot

# -- ineedz a mans -----------------------------------------------------------------------------------------------------
zi from'gh-r' binary lbin lman id-as'auto' for                                                                         \
atclone'mv */* .'                                          @antonmedv/fx                                               \
atclone'mv -f **/*.zsh _bat'              atpull'%atclone' @sharkdp/bat                                                \
atclone'./fd --gen-completions zsh > _fd' atpull'%atclone' @sharkdp/fd                                                 \
atclone'mv -f **/**.zsh _dog'             atpull'%atclone' @ogham/dog                                                  \
atclone'mv rip*/* .'                      atpull'%atclone' @BurntSushi/ripgrep                                         \
atclone'./just --completions zsh > _just' atpull'%atclone' @casey/just                                                 \
atinit'use zoxide.atinit'  lman'*/**.1'                    @ajeetdsouza/zoxide                                         \

#-- pop, pop, fzf, fzf oh wut a relief itis ----------------------------------------------------------------------------
zi for                                                                                                                 \
pack'bgn+keys'                                           @fzf                                                          \
atload'use fzf-tab.atload'                               @Aloxaf/fzf-tab                                               \
atload'use fzf-tab-completion.atload'                    @lincheney/fzf-tab-completion

# -- loners and boners -------------------------------------------------------------------------------------------------
zi for                                                                                                                 \
@zdharma-continuum/zsh-sweep                                                                                           \
@momo-lab/zsh-replace-multiple-dots                                                                                    \
@mafredri/zsh-async                                                                                                    \
@z-shell/zui                                                                                                           \
@toku-sa-n/zsh-dot-up

# -- regular packages --------------------------------------------------------------------------------------------------
zi for                                                                                                                 \
pack                                                                      @dircolors-material                          \
pack                                                                      @ls_colors                                   \
depth'1'                                                                  @romkatv/powerlevel10k                       \
sbin'**/zeno -> zeno'   depth'1'                atload'use zeno.atload'   @yuki-yano/zeno.zsh                          \
sbin'bin/brew' depth'3' atload'use brew.atload' atclone'use brew.atclone' @homebrew/brew

# -- prompt up the jam, prompt it up,p-p-prompt it up ------------------------------------------------------------------
zi wait'1' for                                                                                                         \
  atinit'use fast-syntax-highlighting.atinit'                                                                          \
  atclone'use fast-syntax-highlighting.atclone'                                                                        \
@zdharma-continuum/fast-syntax-highlighting                                                                            \
  blockf                                                                                                               \
  atload'use zsh-completions.atload'                                                                                   \
  atpull'use zsh-completions.atpull'                                                                                   \
@zsh-users/zsh-completions                                                                                             \
  atinit'use zsh-autosuggestions.atinit'                                                                               \
 atload'use zsh-autosuggestions.atload'                                                                                \
@zsh-users/zsh-autosuggestions

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/config/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/config/zsh/.p10k.zsh ]] || source ~/.dotfiles/config/zsh/.p10k.zsh
