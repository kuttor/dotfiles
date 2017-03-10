# Plugin List for installation
# Defer 2 : Load after compinit

# Initialize Zplug
source "$ZPLUG_HOME/init.zsh"

# Manage local plugins
# zplug "~/.zsh", from:local

#zplug "zsh-users/zsh-history-substring-search"
#zplug "plugins/git", from:oh-my-zsh
#zplug "zsh-users/zsh-syntax-highlighting", defer:2





# zplug "plugins/colored-man-pages"
# zplug "zplug/zplug", hook-build:'zplug --self-manage'
# zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-autosuggestions", defer:2

#zplug "knu/z", use:"$LOCALS/z.sh", defer:2
#zplug "mafredri/zsh-async", defer:0
#zplug "b4b4r07/zsh-vimode-visual", use:"*.zsh", defer:3
#zplug "b4b4r07/enhancd", use:init.sh
# zplug 'b4b4r07/zsh-history', use:init.zsh, defer:3

#zplug "b4b4r07/zsh-history-enhanced"
#if zplug check "b4b4r07/zsh-history-enhanced"
#then
#    ZSH_HISTORY_FILTER="fzy:fzf:peco:percol"
#    ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
#    ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
#fi
#zplug "b4b4r07/ssh-keyreg", as:command, use:bin
#zplug "mrowa44/emojify", as:command

#zplug "b4b4r07/ultimate", as:theme

#zplug 'b4b4r07/zplug-doctor', lazy:yes
#zplug 'b4b4r07/zplug-cd', lazy:yes
#zplug 'b4b4r07/zplug-rm', lazy:yes


#zplug "b4b4r07/zsh-gomi", \
#	as:command, \
#	use:bin/gomi, \
#	on:junegunn/fzf-bin

#zplug "Tarrasch/zsh-colors"
#zplug "chrissicool/zsh-256color"


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# Post Plugin settings
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'
