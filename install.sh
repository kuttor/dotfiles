DOTFILES=`pwd`

touch $DOTFILES/.private-gitconfig

echo 'Create $HOME symlink'
ln -sf $DOTFILES/aliases             ~/.aliases
ln -sf $DOTFILES/sources             ~/.sources
# ln -sf $DOTFILES/.completions      ~/.completions
ln -sf $DOTFILES/functions           ~/.functions
ln -sf $DOTFILES/setops              ~/.setops
ln -sf $DOTFILES/sources             ~/.sources
ln -sf $DOTFILES/exports             ~/.exports


# installs for packages

# hub                                                                                 
#git clone https://github.com/github/hub.git ~/Downloads/hub
#~/Downloads/script/build -o ~/.zsh/hub
#eval "$(hub alias -s)"

# install zplug and plugins
git clone https://github.com/b4b4r07/zplug ~/.zplug
source ~/.zplug/init.zsh            
zplug load
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search"
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"
zplug "plugins/git",   from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug load --verbose
zplug install
~                                             
