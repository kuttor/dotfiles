#! /usr/bin/env zsh

# initializes the power10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# installs zinit if missing and sources it
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh" && autoload -Uz _zinit &&(( ${+_comps} )) && _comps[zinit]=_zinit

# =================================================================================================
# -- annexes ~ enhances zinit by ices ------------------------------------------------------------
# =================================================================================================
zi for                                                                                           \
id-as'annex-bin-gem-node'    @zdharma-continuum/zinit-annex-bin-gem-node                         \
id-as'annex-binary-symlink'  @zdharma-continuum/zinit-annex-binary-symlink                       \
id-as'annex-default-ice'     @zdharma-continuum/zinit-annex-default-ice                          \
id-as'annex-patch-dl'        @zdharma-continuum/zinit-annex-patch-dl                             \
id-as'annex-rust'            @zdharma-continuum/zinit-annex-rust

# =================================================================================================
# -- rust based plugins ---------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet lucid light-mode wait'0' rustup
zi for                                                                                            \
id-as'tre' cargo'tre' sbin'bin/tre->tre' atload'use tre.atload' @dduan/tre                        \
id-as'sd'  cargo'sd'  sbin'bin/sd->sd'                          @chmln/sd                         \
id-as'lsd' cargo'lsd' sbin'bin/lsd->lsd'                        @lsd-rs/lsd

# =================================================================================================
# -- manpage based plugins ------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet lucid light-mode wait'0'
zi for                                                                                            \
id-as'annex-man'                              @zdharma-continuum/zinit-annex-man                  \
id-as'asciidoctor' pack                       @asciidoctor                                        \
`id-as'zman'                                   @mattmc3/zman

# =================================================================================================
# -- zsh-configs -----------------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet id-as'zsh-configs' light-mode lucid wait'0' is-snippet
zi for                                                                                            \
@$ZDOTDIR/autoload.zsh                                                                            \
@$ZDOTDIR/options.zsh                                                                             \
@$ZDOTDIR/keybind.zsh                                                                             \
@$ZDOTDIR/aliases.zsh                                                                             \
@$ZDOTDIR/completions.zsh


# ==================================================================================================
# -- omz plugins and libraries ---------------------------------------------------------------------
# ==================================================================================================
zi default-ice --clear --quiet id-as'oh-my-zsh' light-mode lucid wait'0'

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
zi default-ice --clear --quiet light-mode lucid wait'0' from'gh-r'

# github releases
zi for \
id-as'lazygit'       sbin'lazygit -> lazygit'                @jesseduffield/lazygit \
id-as'lemmeknow'     sbin'lemmeknow* -> lemmeknow'           @swanandx/lemmeknow \
id-as'rg'            sbin'**/rg -> rg'                       @BurntSushi/ripgrep \
id-as'glow'          sbin'**/glow'                           @charmbracelet/glow \
id-as'nvim'          sbin'**/nvim -> nvim'                   @neovim/neovim \
id-as'mcfly'         sbin'mcfly* -> mcfly'                   @cantino/mcfly \
id-as'deno'          sbin'* -> deno'                         @denoland/deno \
id-as'fx'            sbin'fx* -> fx'                         @antonmedv/fx \
id-as'assh'          sbin'assh* -> assh'                     @moul/assh \
id-as'shfmt'         sbin'**/sh* -> shfmt'                   @mvdan/sh \
id-as'gh'            sbin'gh_*/bin/gh* -> gh'                @cli/cli \
id-as'diff-so-fancy' sbin'**/diff-so-fancy -> diff-so-fancy' @so-fancy/diff-so-fancy \
id-as'shellcheck'    sbin'*/shellcheck -> shellcheck'        @koalaman/shellcheck \
id-as'tree-sitter'   sbin'*->tree-sitter'     nocompile      @tree-sitter/tree-sitter \
id-as'direnv' atclone'./direnv hook zsh > zhook.zsh' mv"direnv* -> direnv" src'zhook.zsh' @direnv/direnv

# github releases that use hooks 
zi for \
id-as'bat' sbin'**/bat -> bat' atload'use bat.atload'                         @sharkdp/bat \
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
zi default-ice --clear --quiet light-mode lucid wait'0'

zi for \
id-as'zui'        @z-shell/zui \
id-as'zsh-async'  @mafredri/zsh-async \
id-as'zsh-dot-up' @toku-sa-n/zsh-dot-up

zi for                                                                                        \
id-as'fzf-tab'            atload'use fzf-tab.atload'            @Aloxaf/fzf-tab               \
id-as'fzf-tab-completion' atload'use fzf-tab-completion.atload' @lincheney/fzf-tab-completion 

zi for                                                                                        \
id-as'zsh-lint'          @z-shell/zsh-lint \
id-as'zsh-sweep'         @zdharma-continuum/zsh-sweep \
id-as'safe-rm'           @mattmc3/zsh-safe-rm \
id-as'multiple-dots'     @momo-lab/zsh-replace-multiple-dots \

#zinit id`-as'broot' rustup cargo'broot' nocompile sbin'* -> *' for @zdharma-continuum/null

zi for \
id-as'broot' \
atclone'broot --print-shell-function zsh > broot.zsh' \
atpull'%atclone' \
run-atpull \
atload'source broot.zsh' \
as'null' \
    @zdharma-continuum/null

# ==================================================================================================
# -- non-gh-rel packages ---------------------------------------------------------------------------
# ==================================================================================================
zi default-ice --clear --quiet lucid light-mode wait'0'
zi for \
id-as'fzf' pack'bgn-binary+keys' atload"use fzf.atload" @fzf \
id-as'dircolors' pack @dircolors-material \
id-as'ls_colors' pack @ls_colors \
id-as'p10k' depth'1' @romkatv/powerlevel10k \
id-as'zeno' sbin'**/zeno -> zeno' depth'1' atload'use zeno.atload' @yuki-yano/zeno.zsh \
id-as'git-fuzzy' sbin'bin/git-fuzzy -> gfuzzy' blockf atload'use git-fuzzy.atload' @bigH/git-fuzzy

# id-as'url-hl' sbin'url/url* -> url-highlighter' atload'use url-hl.atload' @ascii-soup/zsh-url-highlighter
# id-as'brew' sbin'bin/brew -> brew' depth'3' atload'use brew.atload' atclone'use brew.atclone' @homebrew/brew \

zi for                                                                                          \
id-as'_sd'                                                                                         \
as'completion'                                                                                     \
'https://github.com/chmln/sd/blob/master/gen/completions/_sd'

# ==================================================================================================
# -- autosuggect, highlight, etc -------------------------------------------------------------------
# ==================================================================================================
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
    @zsh-users/zsh-autosuggestions

# To customize prompt, run `p10k configure` 
[[ -f "$DOTFILES/config/.p10k.zsh" ]] && source "$DOTFILES/config/.p10k.zsh"