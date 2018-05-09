#! /bin/bash

# ------------------------------------------------------------------------------
# Name    : bashrc
# About   : Extended user configurations for Bash
# Author  : Andrew Kuttor
# Contact : andrew.kuttor@gmail.com
# ------------------------------------------------------------------------------

# apt packages
apt -y install \
  tree \
  silversearcher-ag \
  wget \
  curl \
  xsel \
  TMUX

# config path
CONFIG="$HOME/.config"

# install fzf
git clone --depth 1 \
"https://github.com/junegunn/fzf.git" "$CONFIG/fzf"
$CONFIG/fzf/install

# install bash prompt 
git clone --depth 1 \
"https://github.com/magicmonty/bash-git-prompt.git" "$CONFIG/bash-prompt"

# install dircolors
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS \
 -O $HOME/.config/dircolors

# sack
cd /tmp
git clone https://github.com/sampson-chen/sack.git && cd sack && chmod +x install_sack.sh && ./install_sack.sh

# simlinking
ln -s $HOME/code/dotfiles/curlrc ~/.curlrc
ln -s $HOME/code/dotfiles/editorconfig ~/.editorconfig
ln -s $HOME/code/dotfiles/inputrc ~/.inputrc
