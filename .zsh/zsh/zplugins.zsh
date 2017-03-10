# Plugin List for installation
# Defer 2 : Load after compinit

# Initialize Zplug
source $HOME/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search", defer:3 # configures after compinit
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # configures after compinit
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "b4b4r07/ultimate", as:theme



# Check for missing plugins and prompt to install them
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load plugins and set plugin paths
zplug load --verbose

# Post Plugin settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'
