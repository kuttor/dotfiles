DOTFILES=`pwd`

touch $DOTFILES/.private-gitconfig

echo 'Create $HOME symlink'
ln -sf $DOTFILES/.aliases             ~/.aliases
ln -sf $DOTFILES/.sources             ~/.sources
ln -sf $DOTFILES/.completions         ~/.completions
ln -sf $DOTFILES/.functions           ~/.functions
ln -sf $DOTFILES/.setops              ~/.setops
ln -sf $DOTFILES/.sources             ~/.sources
