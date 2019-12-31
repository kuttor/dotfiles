#!/usr/bin/env bash

# file: install.sh
# info: creates necessary links/files to setup dotfiles and install packages

# -----------------------------------------------------------------------------

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install the Homebrew packages
$HOME/.dotfiles/brew bundle

# Set ZSH
chsh -s /usr/local/bin/zsh
dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Install Font
wget https://github.com/kencrocken/FiraCodeiScript/blob/master/FiraCodeiScript-Bold.ttf $HOME/Library/Font/
wget https://github.com/kencrocken/FiraCodeiScript/blob/master/FiraCodeiScript-Italic.ttf $HOME/Library/Font/
mv $HOME/.dotfiles/fonts/* /usr/share/fonts/

# Install Zplugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# Enable italics via terminfo
tic -o $HOME/.terminfo $HOME/.dotfiles/iterm/xterm-256color.terminfo

# Setting up symlinks
echo "Setting up simlinks..."
ln -fs "$HOME/.dotfiles/gitconfig"    "$HOME/.gitconfig"
ln -fs "$HOME/.dotfiles/gitignore"    "$HOME/.gitignore"
ln -fs "$HOME/.dotfiles/editorconfig" "$HOME/.editorconfig"
ln -fs "$HOME/.dotfiles/zshrc"        "$HOME/.zshrc"

# Creating hushlogin
echo "Creating hushlogin in HOME"
touch "$HOME/.hushlogin"

