#! /usr/bin/env zsh

p10k_instant_prompt
initialize_zinit

source "${HOME}/.local/share/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#source $HOME/.dotfiles/functions/_ice_custom_mod::repo_name
#source $HOME/.dotfiles/functions/_ice_custom_mod::

# Load custom 
# autoload -Uz _ice_custom_mod:: _ice_custom_mod::repo_name
# ice_custom_mod::
# ice_custom_mod::repo_name

# Source custom functions
# =================================================================================================
# -- snippets -------------------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet lucid wait=0

#id-as'${ice_custom_mod::repo_name}'

zi is-snippet for @$ZDOTDIR/autoload.zsh \     
                  @$ZDOTDIR/options.zsh    \
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  































































































                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                                                                                \@$ZDOTDIR/keybind.zsh                                                                 \@$ZDOTDIR/aliases.zsh                                                                 \@$ZDOTDIR/completions.zsh

zi default-ice --clear --quiet \
                lucid \
wait=0

#id-as"$ice_custom_mod::repo_name"

zi for \
OMZL::{completion,compfix,correction,history}.zsh                                           \
OMZP::{brew,gnu-utils,colorize,web-search,ssh,pip,cp,grc,urltools}  OMZP::magic-enter  \

# =================================================================================================
# -- github packages ------------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet lucid wait=0 from=gh-r

#id-as"$ice_custom_mod::repo_name"

# Simple installations
zinit for sbin'lazygit -> lazygit' @jesseduffield/lazygit                              
zinit for sbin'lazygit -> lazygit' atclone"source /Documents/myfile.conf" atinit"source /Configmyfile.conf"   @jesseduffield/lazygit                              
zinit for sbin'lazygit -> lazygit' @jesseduffield/lazygit                              







    sbin'lemmeknow* -> lemmeknow'              @swanandx/lemmeknow                                 \
    sbin'**/rg -> rg'                          @BurntSushi/ripgrep                                 \
    sbin'**/glow'                              @charmbracelet/glow                                 \
    sbin'**/nvim -> nvim'                      @neovim/neovim                                      \
    sbin'mcfly* -> mcfly'                      @cantino/mcfly                                      \
    sbin'* -> deno'                            @denoland/deno                                      \
    sbin'fx* -> fx'                            @antonmedv/fx                                       \
    sbin'assh* -> assh'                        @moul/assh                                          \
    sbin'tre* -> tre'                          @dduan/tre                                          \
    sbin'**/sh* -> shfmt'                      @mvdan/sh                                           \
    sbin'gh_*/bin/gh* -> gh'                   @cli/cli                                            \
    sbin'*/shellcheck -> shellcheck'           @koalaman/shellcheck                                \
    sbin'**/fastfetch -> fastfetch'            @fastfetch-cli/fastfetch                            \
    sbin'**/diff-so-fancy -> diff-so-fancy'    @so-fancy/diff-so-fancy

# Installations with additional commands
zi default-ice --clear --quiet lucid wait=0 from=gh-r

#id-as"$ice_custom_mod::repo_name" 

zi for                                                                                             \
    sbin'**/bat -> bat'                        @sharkdp/bat                                        \
    sbin'**/fd -> fd'                          @sharkdp/fd                                         \
    sbin'*/lsd -> lsd'                         @lsd-rs/lsd                                         \
    sbin'zoxide -> zoxide'  nocompile'!'       @ajeetdsouza/zoxide

# =================================================================================================
# -- zsh plugins ----------------------------------------------------------------------------------
# =================================================================================================
zi default-ice --clear --quiet \
    light-mode                     \
    lucid                     \
    wait=0 

#id-as"$ice_custom_mod::repo_name"

zi for                                                                                             \
  zdharma-continuum/fast-syntax-highlighting                                                     \
  zsh-users/zsh-autosuggestions                                                                  \
  zsh-users/zsh-completions                                                                      \
  junegunn/fzf                                                                                  \
  Aloxaf/fzf-tab                                                                                  \
  MichaelAquilina/zsh-you-should-use                                                              \
  hlissner/zsh-autopair                                                                          \
  jeffreytse/zsh-vi-mode                                                                          \
  zsh-users/zsh-history-substring-search  

# =================================================================================================
# -- theme ----------------------------------------------------------------------------------------
# =================================================================================================
zi default-ice \
--clear     \
--quiet     \
    lucid light-mode wait=0

zi for depth=1 @romkatv/powerlevel10k

[[ -f "$XDG_CONFIG_HOME/p10k.zsh" ]] && . "$XDG_CONFIG_HOME/p10k.zsh"