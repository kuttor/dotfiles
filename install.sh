# set package manager (DNF or APT)
python -mplatform | grep -qi ubuntu && pkgman=apt || pkgman=dnf

# multiple package installer
sudo $pkgman install git tree

# perform update
sudo $pkgman update  -y

# install percol
sudo $pkgman install percol -y

# install Go language
sudo $pkgman install golang -y

# install pip
sudo $pkgman install python-pip y

# install peco
echo "\nInstalling Peco"
export PATH=$PATH:/usr/local/go/bin
go get github.com/peco/peco/cmd/peco
cd 
# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.zsh/fzf
$HOME/zsh/fzf/install

# install powerline fonts
git clone https://github.com/powerline/fonts.git $HOME/.zsh/powerline-fonts
$HOME/.zsh/powerline-fonts/install.sh

# install vimpager
git clone git://github.com/rkitover/vimpager $HOME/Development/vimpager
sudo $HOME/Development/vimpager/make install

# install antigen
curl https://cdn.rawgit.com/zsh-users/antigen/v1.0.4/antigen.zsh > $HOME/.zsh/.antigen-source.zsh

# adding dotfiles to .zshrc
dotfiles=`pwd`
echo 'Adding source location to .zshrc'
echo "\n\n# dotfile sources"      >> $HOME/.zshrc
echo "source $dotfiles/antigen"   >> $HOME/.zshrc
echo "source $dotfiles/aliases"   >> $HOME/.zshrc
echo "source $dotfiles/functions" >> $HOME/.zshrc
echo "source $dotfiles/exports"   >> $HOME/.zshrc
                                  
# Cool manual installations
# Vimpager: https://github.com/rkitover/vimpager
# Hub for Git: https://github.com/github/hub

