#! /usr/bin/env zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# installs zinit if missing and sources it
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
[ ! -d "${ZINIT_HOME}" ] && mkdir -p "$(dirname "${ZINIT_HOME}")"
[ ! -d "${ZINIT_HOME}/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
source "${ZINIT_HOME}/zinit.zsh" && autoload -Uz _zinit &&(( ${+_comps} )) && _comps[zinit]=_zinit

# -- ice ice baby ---------------------------------------------------------------------------------
zi lucid light-mode for                                                                            \
id-as'annex-bin-gem-node'   @zdharma-continuum/zinit-annex-bin-gem-node                            \
id-as'annex-binary-symlink' @zdharma-continuum/zinit-annex-binary-symlink                          \
id-as'annex-default-ice'    @zdharma-continuum/zinit-annex-default-ice                             \
id-as'annex-patch-dl'       @zdharma-continuum/zinit-annex-patch-dl                                \
id-as'annex-link-man'       @zdharma-continuum/zinit-annex-link-man                                \
id-as'annex-rust'           @zdharma-continuum/zinit-annex-rust

# -- fargo cargo ---------------------------------------------------------------------------------
zi default-ice --clear --quiet lucid light-mode wait'0' rustup
zi for                                                                                             \
id-as'tre'    sbin'bin/tre->tre'       cargo'tre'    atload'use tre.atload'    @dduan/tre          \
id-as'lsd'    sbin'bin/lsd->lsd'       cargo'lsd'    atload'use lsd.atload'    @lsd-rs/lsd         \
id-as'sd'     sbin'bin/sd->sd'         cargo'sd'                               @chmln/sd           \
id-as'rip'    sbin'bin/rip->rip'       cargo'rm-improved'                      @nivekuil/rip       \
id-as'tlrc'   sbin'bin/tlrc->tlrc'     cargo'tlrc'                             @tldr-pages/tlrc    \
id-as'zoxide' sbin'bin/zoxide->zoxide' cargo'zoxide' atload'use zoxide.atload' @ajeetdsouza/zoxide

# -- manpage renovations --------------------------------------------------------------------------
zi default-ice --clear --quiet lucid light-mode wait'0'

zi for                                                                                             \
id-as'zshelldoc'                                                                                   \
  lbin make"PREFIX=$ZPFX install"                                                                  \
  reset                                                                                            \
  atpull'%atclone'                                                                                 \
  atdelete"PREFIX=$ZPFX make uninstall"                                                            \
  @zdharma-continuum/zshelldoc                                                                     \
id-as'annex-man'                                                                                   \
  @zdharma-continuum/zinit-annex-man                                                               \
id-as'asciidoctor'                                                                                 \
  pack                                                                                             \
  @asciidoctor                                                                                     \
id-as'zman'                                                                                        \
  @mattmc3/zman

# -- con-air, con-artist, con-man and now con-fig-------------------------------------------------c
zi default-ice --clear --quiet id-as'zsh-configs' light-mode lucid wait'0' is-snippet
zi for                                                                                            \
@$ZDOTDIR/autoload.zsh                                                                            \
@$ZDOTDIR/options.zsh                                                                             \
@$ZDOTDIR/keybind.zsh                                                                             \
@$ZDOTDIR/alixases.zsh                                                                            \
@$ZDOTDIR/completions.zsh

# -- omz plugins and libraries ----------------------------------------------------------------------
zi default-ice --clear --quiet light-mode lucid wait'0' id-as'omz-snippets'
zi for                                                                                          \
OMZL::theme-and-appearance.zsh                                                                  \
OMZL::key-bindings.zsh                                                                          \
OMZL::completion.zsh                                                                            \
OMZL::correction.zsh                                                                            \
OMZL::compfix.zsh                                                                               \
OMZL::history.zsh                                                                               \
OMZP::colorize                                                                                  \
OMZP::urltools                                                                                  \
OMZP::brew                                                                                      \
OMZP::git                                                                                       \
OMZP::cp                                                                                        \
OMZP::grc                                                                                       \
atload'use magic-enter.atload' OMZP::magic-enter

# rub a dub dub there's gits in my hubs -------------------------------------------------------------------------
zi default-ice --clear --quiet light-mode lucid wait'0' from'gh-r'
zi for                                                                                                                 \
id-as'lazygit'                                          sbin'lazygit->lazygit'                @jesseduffield/lazygit   \
id-as'lemmeknow'                                        sbin'lemmeknow*->lemmeknow'           @swanandx/lemmeknow      \
id-as'gh'                                               sbin'gh_*/bin/gh*->gh'                @cli/cli                 \
id-as'fx'                                               sbin'fx*->fx'                         @antonmedv/fx            \
id-as'rg'  binary lbin lman atclone'mv rip*/* .'          atpull'%atclone'                    @BurntSushi/ripgrep      \
id-as'dog' binary lbin lman atclone'mv -f **/**.zsh _dog' atpull'%atclone'                    @ogham/dog               \
id-as'bat' binary lbin lman atclone'mv -f **/*.zsh _bat'  atpull'%atclone'                    @sharkdp/bat             \
id-as'glow'                                             sbin'**/glow->glow'                   @charmbracelet/glow      \
id-as'just' binary lbin lman  atclone'./just --completions zsh > _just' atpull'%atclone'      @casey/just              \
id-as'nvim'                                             sbin'**/nvim->nvim'                   @neovim/neovim           \
id-as'mcfly'                                            sbin'mcfly*->mcfly'                   @cantino/mcfly           \
id-as'deno'                                             sbin'*->deno'                         @denoland/deno           \
id-as'assh'                                             sbin'assh*->assh'                     @moul/assh               \
id-as'shfmt'                                            sbin'**/sh*->shfmt'                   @mvdan/sh                \
id-as'direnv'                                           sbin'direnv*->direnv'                 @direnv/direnv           \
id-as'diff-so-fancy'                                    sbin'**/diff-so-fancy->diff-so-fancy' @so-fancy/diff-so-fancy  \
id-as'shellcheck'                                       sbin'*/shellcheck->shellcheck'        @koalaman/shellcheck     \
id-as'tree-sitter'                        nocompile     sbin'*->tree-sitter->tree-sitter'     @tree-sitter/tree-sitter \
id-as'antidot'        atload'use antidot.atload'        sbin'antidot*->antidot'               @doron-cohen/antidot     \
id-as'fd' binary lbin lman atpull'%atclone' atload'use fd.atload' atclone'use fd.atclone'     @sharkdp/fd


#-- pop, pop, fzf, fzf oh wut a relief itis -----------------------------------------------------
zi default-ice --clear --quiet light-mode lucid wait'0'
zi for                                                                                             \
id-as'fzf-tab'            atload'use fzf-tab.atload'            @Aloxaf/fzf-tab                    \
id-as'fzf-tab-completion' atload'use fzf-tab-completion.atload' @lincheney/fzf-tab-completion      \
id-as'git-fuzzy' sbin'bin/git-fuzzy -> gfuzzy' blockf atload'use git-fuzzy.atload' @bigH/git-fuzzy

# -- loners and boners -----------------------------------------------------------------------------
zi for                                                                                             \
id-as'zsh-lint'       @z-shell/zsh-lint                                                            \
id-as'zsh-sweep'      @zdharma-continuum/zsh-sweep                                                 \
id-as'safe-rm'        @mattmc3/zsh-safe-rm                                                         \
id-as'multiple-dots'  @momo-lab/zsh-replace-multiple-dots                                          \
id-as'zsh-async'      @mafredri/zsh-async                                                          \
id-as'zui'            @z-shell/zui                                                                 \
id-as'zsh-dot-up'     @toku-sa-n/zsh-dot-up

# -- regular packages ------------------------------------------------------------------------------
zi default-ice --clear --quiet lucid light-mode wait'0'
zi for                                                                                              \
id-as'dircolors' pack @dircolors-material                                                           \
id-as'ls_colors' pack @ls_colors                                                                    \
id-as'p10k' depth'1' @romkatv/powerlevel10k                                                         \
id-as'zeno' sbin'**/zeno -> zeno' depth'1' atload'use zeno.atload' @yuki-yano/zeno.zsh              \
id-as'brew' sbin'bin/brew' depth'3' atload'use brew.atload' atclone'use brew.atclone' @homebrew/brew

# -- prompt up the jam, prompt it up,p-p-prompt it up ----------------------------------------------
zi default-ice --clear --quiet light-mode lucid wait'1'
zi for                                                                                             \
id-as'fast-syntax-highlighting'                                                                    \
    atinit'use fast-syntax-highlighting.atinit'                                                    \
    atclone'use fast-syntax-highlighting.atclone'                                                  \
    @zdharma-continuum/fast-syntax-highlighting                                                    \
id-as'zsh-completions'                                                                             \
    blockf                                                                                         \
    atload'use zsh-completions.atload'                                                             \
    atpull'use zsh-completions.atpull'                                                             \
    @zsh-users/zsh-completions                                                                     \
id-as'zsh-autosuggestions'                                                                         \
    atinit'use zsh-autosuggestions.atinit'                                                         \
    atload'use zsh-autosuggestions.atload'                                                         \
    @zsh-users/zsh-autosuggestions                                                                 \
    sh-users/zsh-autosuggestions                                                                   \
id-as'zsh-history-substring-search'                                                                \
    atload'use zsh-history-substring-search.atload'                                                \
    @zsh-users/zsh-history-substring-search

# -- romper prompter ------------------------------------------------------------------------------
[[ ! -f "${HOME}/.p10k.zsh" ]] || source "${HOME}/.p10k.zsh"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/config/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/config/zsh/.p10k.zsh ]] || source ~/.dotfiles/config/zsh/.p10k.zsh
