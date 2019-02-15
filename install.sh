#!/bin/bash
# -----------------------------------------------------------------------------
# file: install.sh
# info: creates necessary links/files to setup dotfiles
# -----------------------------------------------------------------------------

ln -s "/Users/$(whoami)/.dotfiles/gitconfig" "/Users/$(whoami)/.gitconfig"
ln -s "/Users/$(whoami)/.dotfiles/gitignore" "/Users/$(whoami)/.gitignore"
ln -s "/Users/$(whoami)/.dotfiles/vimrc.local" "/Users/$(whoami)/.vimrc.local"

# Setup TMUX
mkdir "$HOME/.config/tmux"
ln -s "/Users/$(whoami)/.dotfiles/tmux/tmux.conf" "/Users/$(whoami)/.config/tmux/tmux.config"

# Download Jenkins-clii
#jenkings_staging_address=172.16.167.190:8443
#http://<jenkings_staging_address>/jnlpJars/jenkins-cli.jar 

touch "$HOME/.hushlogin"

