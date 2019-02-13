#!/bin/bash
# -----------------------------------------------------------------------------
# file: install.sh
# info: creates necessary links/files to setup dotfiles
# -----------------------------------------------------------------------------

ln -s "/Users/$(whoami)/.dotfiles/gitconfig" "/Users/$(whoami)/.gitconfig"
ln -s "/Users/$(whoami)/.dotfiles/gitignore" "/Users/$(whoami)/.gitignore"
ln -s "/Users/$(whoami)/.dotfiles/vimrc.local" "/Users/$(whoami)/.vimrc.local"

touch "$HOME/.hushlogin"
