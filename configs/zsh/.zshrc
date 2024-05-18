#!/usr/bin/env zsh
#-*- mode: shell-script -*-
#vim: ft=zsh st=zsh sw=2 ts=2 sts=0

# --- powerlevel10k instant prompt ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- zinit load ---
local ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"]
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Start profiler
if [[ "${ZSH_PROFILE}" == 1 ]]; then
    zmodload zsh/zprof
else
    ZSH_PROFILE=0
fi

# Zinit Annexes
zinit for                                                                              \
zdharma-continuum/zinit-annex-binary-symlink                                           \
zdharma-continuum/zinit-annex-meta-plugins                                             \
zdharma-continuum/zinit-annex-default-ice                                              \
zdharma-continuum/zinit-annex-as-monitor                                               \
zdharma-continuum/zinit-annex-link-man                                                 \
zdharma-continuum/zinit-annex-pull                                                     \
zdharma-continuum/zinit-annex-man                                                      \
annexes                                                                                \
zsh-users+fast                                                                         \
console-tools                                                                          \
zdharma2                                                                               \
zdharma                                                                                \
ext-git

#zinit for                                                                             \
#NICHOLAS85/z-a-linkbin                                                                \
#NICHOLAS85/z-a-eval

# ~=============================================================================
# (1) LOAD FIRST PLUGINS
zinit default-ice -cq wait"0" lucid light-mode
# ~=============================================================================

zinit snippet "${ZSH_CONFIG_DIR}/paths.zsh"
zinit snippet "${ZSH_CONFIG_DIR}/autoloads.zsh"
zinit snippet "${ZSH_CONFIG_DIR}/aliases.zsh"
zinit snippet "${ZSH_CONFIG_DIR}/options.zsh"
zinit snippet "${ZSH_CONFIG_DIR}/keybindings.zsh"
zinit snippet "${ZSH_CONFIG_DIR}/modules.zsh"

# zman ~ adds completion for loading zman pages
zinit for mattmc3/zman

# Prompt: Powerlevel10k
zinit for                                                                              \
  depth="1"                                                                            \
@romkatv/powerlevel10k

# lsd ~ the next gen ls command
zinit for                                                                              \
  from"gh-r"                                                                           \
  as"command"                                                                          \
  bpick"lsd-*"                                                                         \
  pick"lsd-*/lsd"                                                                      \
  atload"hook lsd.atload.zsh"                                                          \
  sbin"lsd -> lsd"                                                                     \
@lsd-rs/lsd

# fzf ~ A command-line fuzzy finder
zinit pack"bgn-binary+keys" for fzf

# fzf-preview ~ adds a popup window via tmux within standard shell mode
zinit for                                                                              \
  atload"hook fzf-preview.atload.zsh"                                                  \
  blockf                                                                               \
  depth"1"                                                                             \
@yuki-yano/fzf-preview.zsh

# fzf-tab ~ A powerful completion engine for Zsh that uses fzf
zinit for                                                                              \
  atload"hook fzf-tab.atload.zsh"                                                      \
@Aloxaf/fzf-tab

# Zsh-fzf-utils ~ A collection of utilities for fzf and Zsh
zinit for @redxtech/zsh-fzf-utils

# zsh-abbr ~ is the zsh manager for abbreviations
zinit for                                                                              \
  atload"hook zsh-abbr.atload.zsh"                                                     \
  atpull"%atclone"                                                                     \
  sbin"zsh-abbr -> abbr"                                                               \
  as"completion"                                                                       \
  dl"https://github.com/olets/zsh-abbr/tree/main/completions/_abbr"                    \
olets/zsh-abbr

zinit for                                                                              \
  atload'source ${HOME}/.dotfiles/configs/zeno/zeno'                                   \
  blockf                                                                               \
  depth"1"                                                                             \
  sbin"**/zeno -> zeno" \
yuki-yano/zeno.zsh


# OH-My-Zsh Libraries ~ A collection of plugin libraries from Oh My Zsh
zinit for                                                                              \
OMZL::completion.zsh                                                                   \
OMZL::compfix.zsh                                                                      \
OMZL::correction.zsh                                                                   \
OMZL::directories.zsh                                                                  \
OMZL::functions.zsh                                                                    \
OMZL::git.zsh                                                                          \
OMZL::history.zsh                                                                      \
OMZL::misc.zsh                                                                         \
OMZL::termsupport.zsh                                                                  \
OMZL::theme-and-appearance.zsh                                                         \
OMZL::vcs_info.zsh

# Oh-my-zsh Plugins ~ A collection of plugins from Oh My Zsh
zinit for                                                                              \
OMZP::aws                                                                              \
OMZP::colored-man-pages                                                                \
OMZP::colorize                                                                         \
OMZP::common-aliases                                                                   \
OMZP::composer                                                                         \
OMZP::copyfile                                                                         \
OMZP::copypath                                                                         \
OMZP::cp                                                                               \
OMZP::extract                                                                          \
OMZP::fancy-ctrl-z                                                                     \
OMZP::git                                                                              \
OMZP::github                                                                           \
OMZP::gitignore                                                                        \
OMZP::nvm                                                                              \
OMZP::pip                                                                              \
OMZP::sudo                                                                             \
OMZP::ssh-agent                                                                        \
OMZP::urltools                                                                         \
OMZP::tmux                                                                             \
OMZP::vscode                                                                           \
OMZP::web-search                                                                       \
  atload"hook magic-enter.atload.zsh"                                                  \
OMZP::magic-enter

# ls_colors ~ A collection of LS_COLORS definitions
zinit pack for "ls_colors"

# dircolors-material ~ A dircolors theme inspired by Material Design
zinit pack for "dircolors-material"

# warhol ~ a zsh plugin for syntax highlighting
zinit for "unixorn/warhol.plugin.zsh"

# zsh-256color ~ a zsh plugin for 256 color support
zinit for "chrissicool/zsh-256color"

# neovim ~ the next gen Vim
zinit for                                                                              \
  from"gh-r"                                                                           \
  sbin"**/nvim -> nvim"                                                                \
  ver"nightly"                                                                         \
neovim/neovim

# tmux-vim-integration.plugin.zsh ~ a zsh plugin for tmux and v`im integration
zinit for                                                                              \
  atload"hook tmux-vim-integration.atload.zsh"                                         \
@jsahlen/tmux-vim-integration.plugin.zsh

## zsh-lint, zsh-sweep ~ linters  for zsh and shell scripts
zinit for zdharma-continuum/{zsh-lint,zsh-sweep}

# shell
zinit for                                                                              \
  from"gh-r"                                                                           \
  sbin"**/sh* -> shfmt"                                                                \
@mvdan/sh

zinit for                                                                              \
zdharma-continuum/zsh-startify                                                         \
zdharma-continuum/zzcomplete                                                           \
zdharma-continuum/git-url

# zsh-safe-rm ~ prevent the accidental deletion of important files
zinit for mattmc3/zsh-safe-rm

# zsh-replace-multiple-dots ~ A Zsh plugin that replaces multiple dots
zinit for momo-lab/zsh-replace-multiple-dots

# zsh-plugin-reload ~ A Zsh plugin that reloads plugins
zinit for aubreypwd/zsh-plugin-reload

# zsh-recall ~ makes history easier
zinit for mango-tree/zsh-recall

# Zsh-Autopair ~ Auto-pairing quotes, brackets, etc in command line
zinit for                                                                              \
  nocompletions                                                                        \
  compile"*.zsh"                                                                       \
  atload"hook zsh-autopair.atload.zsh"                                                 \
  atinit"hook zsh-autopair.atinit.zsh"                                                 \
hlissner/zsh-autopair

# Auto installs the iTerm2 shell integration for Zsh
zinit for                                                                              \
  pick"shell_integration/zsh"                                                          \
  sbin"utilities/*"                                                                    \
gnachman/iTerm2-shell-integration

# git-fuzzy ~ A CLI interface to git that relies on fzf
zinit for                                                                              \
  as"program"                                                                          \
  pick"bin/git-fuzzy"                                                                  \
  sbin"git-fuzzy -> git-fuzzy"                                                         \
bigH/git-fuzzy

# Neofetch ~ A command-line system information tool
zinit for                                                                              \
  make                                                                                 \
@dylanaraps/neofetch

# ~=============================================================================
# Load Second
zinit default-ice -cq wait"1" lucid light-mode
# ~=============================================================================

# lazygit ~ A simple terminal UI for git commands
zinit for                                                                              \
  as"command"                                                                          \
  from"gh-r"                                                                           \
  sbin"lazygit -> lazygit"                                                          \
jesseduffield/lazygit

zinit for                                                                              \
  from"gh-r"                                                                           \
  as"program"                                                                          \
  mv"gh_*/bin/gh* -> gh"                                                               \
  sbin"gh -> gh"                                                                       \
@cli/cli

zinit for                                                                              \
  from"gh-r"                                                                           \
  mv"tealdeer* -> tealdeer"                                                            \
  pick"tealdeer -> tealdeer"                                                           \
  dl"https://github.com/dbrgn/tealdeer/blob/main/completion/zsh_tealdeer -> _tealdeer" \
  sbin"tealdeer -> tldr"                                                               \
@dbrgn/tealdeer


# eza ~ A simple and fast Zsh plugin manager
zinit for                                                                              \
  atclone"hook eza.atclone.zsh"                                                        \
  atload"hook eza.atload.zsh"                                                          \
  atpull"%atclone"                                                                     \
  pick"eza.zsh"                                                                        \
  dl"https://github.com/eza-community/eza/blob/main/completions/zsh/_eza -> _eza"      \
  sbin"eza -> eza"                                                                     \
@eza-community/eza

# declare-zsh
zinit for                                                                              \
zdharma-continuum/declare-zsh

# sharkdp/fd ~ A simple, fast and user-friendly alternative to 'find'
zinit for                                                                              \
  as"command"                                                                          \
  from"gh-r"                                                                           \
  mv"fd* -> fd"                                                                        \
  pick"fd/fd"                                                                          \
  sbin"*/fd -> fd"                                                                   \
@sharkdp/fd

# sharkdp/bat ~ A cat(1) clone with wings
zinit for                                                                              \
  as"command"                                                                          \
  from"gh-r"                                                                           \
  mv"bat* -> bat"                                                                      \
  sbin"*/bat -> bat"                                                                   \
  pick"bat/bat"                                                                        \
@sharkdp/bat

# bin-gem-node annex: Warning: The sbin'' ice (`**/delta -> delta') didn't match any files
# delta ~ A viewer for git and diff output
zinit for \
  as"command" \                                                                        \
  sbin"**/delta -> delta"                                                              \
dandavison/delta

# bin-gem-node annex: Warning: The sbin'' ice (`glow -> glow') didn't match any files
# glow ~ A markdown reader for the terminal
zinit for                                                                              \
  from"gh-r"                                                                       \
  sbin"**/glow -> glow" \                                                                  \
@charmbracelet/glow

#@Warning: mv ice didn't match any file. [zoxide*/zoxide -> zoxide]
# zoxide ~ A smarter cd command
zinit for                                                                              \
  as"command"                                                                          \
  from"gh-r"                                                                           \
  mv"zoxide*/zoxide -> zoxide"                                                         \
  atclone"./zoxide init zsh > init.zsh"                                                \
  atpull"%atclone"                                                                     \
  src"init.zsh"                                                                        \
  nocompile"!"                                                                         \
@ajeetdsouza/zoxide

# zsh-thefuck ~ provides tips for the terminal
zinit for                                                                              \
  atinit"hook thefuck.atinit.zsh"                                                      \
@laggardkernel/zsh-thefuck

# github-Copilot ~ A CLI for GitHub Copilot
zinit  snippet "https://gist.githubusercontent.com/iloveitaly/a79ffc31ef5b4785da8950055763bf52/raw/4140dd8fa63011cdd30814f2fbfc5b52c2052245/github-copilot-cli.zsh"

# deno ~ A simple and
zinit for                                                                              \
  from"gh-r"                                                                           \
  nocompile                                                                            \
  sbin"* -> deno"                                                                      \
@denoland/deno

# yank ~ Yank terminal output to clipboard
zinit for                                                                              \
  make                                                                                 \
  sbin"yank.1 -> yank"                                                                 \
@mptre/yank



# To customize: run `p10k configure` or edit .p10k.zsh.
[[ ! -f "$DOTFILES[CONFIGS]/.p10k.zsh" ]] || source "$DOTFILES[CONFIGS]/.p10k.zsh"
