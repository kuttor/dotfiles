#!/bin/bash
# -----------------------------------------------------------------------------
# file: install.sh
# info: creates necessary links/files to setup dotfiles
# -----------------------------------------------------------------------------

ln -s "/home/$(whoami)/.dotfiles/gitconfig" "/home/$(whoami)/.gitconfig"
ln -s "/home/$(whoami)/.dotfiles/gitignore" "/home/$(whoami)/.gitignore"

# Setup TMUX
mkdir "$HOME/.config/tmux"
ln -s "/home/$(whoami)/.dotfiles/tmux/tmux.conf" "/home/$(whoami)/.config/tmux/tmux.config"

# Coding
mkdir "$HOME/Code"

# Download Jenkins-clii
#jenkings_staging_address=172.16.167.190:8443
#http://<jenkings_staging_address>/jnlpJars/jenkins-cli.jar 

touch "$HOME/.hushlogin"

