#! /usr/bin/env zsh
#File: '${HOME}/.dotfiles/configs/zeno.zsh'
#Vim: set filetype=zsh syntax=zsh

# if disable deno cache command when plugin loaded
# export ZENO_DISABLE_EXECUTE_CACHE_COMMAND=1

# if enable fzf-tmux
export ZENO_ENABLE_FZF_TMUX=1

# if setting fzf-tmux options
export ZENO_FZF_TMUX_OPTIONS="-p"

# Experimental: Use UNIX Domain Socket
export ZENO_ENABLE_SOCK=1

# if disable builtin completion
# export ZENO_DISABLE_BUILTIN_COMPLETION=1

# git file preview with color
export ZENO_GIT_CAT="bat --color=always"

# git folder preview with color
export ZENO_GIT_TREE="lsd --tree"

if [[ -n $ZENO_LOADED ]]; then
  bindkey '^m' zeno-auto-snippet-and-accept-line
  bindkey '^i' zeno-completion
  bindkey '^x ' zeno-insert-space
  bindkey '^x^m' accept-line
  bindkey '^x^z' zeno-toggle-auto-snippet
  bindkey ' ' zeno-auto-snippet
  bindkey '^r' zeno-history-selection
  bindkey '^x^s' zeno-insert-snippet
  bindkey '^x^f' zeno-ghq-cd
fi
