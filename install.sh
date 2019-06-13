# -----------------------------------------------------------------------------

# Vars
FONTS=/usr/share/fonts

ln -fs "$HOME/.dotfiles/gitconfig"    "$HOME/.gitconfig"
ln -fs "$HOME/.dotfiles/gitignore"    "$HOME/.gitignore"
ln -fs "$HOME/.dotfiles/editorconfig" "$HOME/.editorconfig"

touch "$HOME/.hushlogin"

# Set ZSH
chsh -s `which zsh`
dscl . -create /Users/$USER UserShell `which zsh`

# Reset Security changes
chown -R $(whoami):admin /usr/local

# Install Font
wget https://github.com/kencrocken/FiraCodeiScript/blob/master/FiraCodeiScript-Bold.ttf $FONTS
wget https://github.com/kencrocken/FiraCodeiScript/blob/master/FiraCodeiScript-Italic.ttf $FONTS
wget https://github.com/kencrocken/FiraCodeiScript/blob/master/FiraCodeiScript-Bold.ttf $FONTS

# Install fzy
curl -s https://packagecloud.io/install/repositories/jhawthorn/fzy/script.deb.sh | sudo bash

# Install Zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Custom ZSH Config
ln -fs $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
