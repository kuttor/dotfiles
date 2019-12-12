#!/bin/bash

# file: install.sh
# info: creates necessary links/files to setup dotfiles
# Deps: wget, curl, exa, fzf, git, ripgrep

# -----------------------------------------------------------------------------

ln -fs "$HOME/.dotfiles/gitconfig"    "$HOME/.gitconfig"
ln -fs "$HOME/.dotfiles/gitignore"    "$HOME/.gitignore"
ln -fs "$HOME/.dotfiles/editorconfig" "$HOME/.editorconfig"

touch "$HOME/.hushlogin"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Set ZSH
chsh -s /usr/local/bin/zsh
dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Install Font
wget https://github.com/kencrocken/FiraCodeiScript/blob/master/FiraCodeiScript-Bold.ttf /Users/akuttor/Library/Font/
wget https://github.com/kencrocken/FiraCodeiScript/blob/master/FiraCodeiScript-Italic.ttf /Users/akuttor/Library/Font/
mv $HOME/.dotfiles/fonts/* /usr/share/fonts/

# Install Zplugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# Custom ZSH Config
ln -fs $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc

# Enable italics via terminfo
tic -o $HOME/.terminfo $HOME/.dotfiles/iterm/xterm-256color.terminfo
