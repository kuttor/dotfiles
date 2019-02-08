#!/bin/bash

ln -s /Users/$(whoami)/.dotfiles/zshrc /Users/$(whoami)/.zshrc
ln -s /Users/$(whoami)/.dotfiles/gitconfig /Users/$(whoami)/.gitconfig
ln -s /Users/$(whoami)/.dotfiles/gitignore /Users/$(whoami)/.gitignore

mkdir $HOME/.config/bitbar-plugins
ln -s /Users/$(whoami)/.dotfiles/openconnect.sh /Users/$(whoami)/.config/bitbar-plugins/openconnect.sh

sudo echo "$(whoami) ALL=(ALL) NOPASSWD: /usr/local/bin/openconnect" >> /etc/sudoers
sudo echo "$(whoami) ALL=(ALL) NOPASSWD: /usr/bin/killall -2 openconnect.sh" >> /etc/sudoers
