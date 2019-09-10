#!/usr/local/bin/zsh -f
# -*- coding: utf-8 -*-

# file: zplug.zsh
# info: Zplug config file to init, load, and install Zsh/Zplug plugins
# name: Andrew Kuttor
# mail: andrew.kuttor@gmail.com

# Load Zplug
source "$HOME/.zplug/init.zsh"

# Let Zplug manage itself
#zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async",  from:github
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "djui/alias-tips"
zplug "tysonwolker/iterm-tab-colors", from:github
zplug "zpm-zsh/tmux", from:github
zplug "jsahlen/tmux-vim-integration.plugin.zsh", from:github
zplug "changyuheng/zsh-interactive-cd"
zplug "knu/zsh-manydots-magic"
zplug "chrissicool/zsh-bash", from:oh-my-zsh
zplug "github/hub", from:github
zplug "hlissner/zsh-autopair"
zplug "unixorn/git-extra-commands", from:github
zplug "seletskiy/zsh-git-smart-commands",  from:github
zplug "rapgenic/zsh-git-complete-urls", from:github
zplug "peco/peco", from:gh-r, as:command
zplug "zpm-zsh/colors", from:github
zplug "rupa/z", from:github, use:z.sh
zplug "skywind3000/z.lua", from:github
zplug "junegunn/fzf", from:github, as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
zplug "andrewferrier/fzf-z", from:github
zplug "aperezdc/zsh-fzy", from:github
#zplug "jimeh/zsh-peco-history", from:github, defer:2, hook-build:'ZSH_PECO_HISTORY_DEDUP=1'
zplug "ytet5uy4/fzf-widgets", from:github, hook-load:'FZF_WIDGET_TMUX=1'
zplug "timothyrowan/betterbrew-zsh-plugin", from:github
zplug "oldratlee/hacker-quotes", from:github
# From Oh-My-ZSH
zplug "lib/clipboard", from:oh-my-zsh,            if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/virtualenv", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/completion", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh,             if:"(( $+commands[git] ))"
zplug "plugins/gitignore", from:oh-my-zsh,        if:"(( $+commands[git] ))"
zplug "plugins/git-prompt", from:oh-my-zsh,       if:"(( $+commands[git] ))"
zplug "plugins/nmap", from:oh-my-zsh,             if:"(( $+commands[nmap] ))"
zplug "plugins/pylint", from:oh-my-zsh,           if:"(( $+commands[pylint] ))"
zplug "plugins/python", from:oh-my-zsh,           if:"(( $+commands[python] ))"
zplug "plugins/sudo", from:oh-my-zsh,             if:"(( $+commands[sudo] ))"

# zsh users
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-autosuggestions", from:github, as:plugin
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-history-substring-search", from:github

# -----------------------------------------------------------------------------

# History EnhanCD
if zplug check "b4b4r07/zsh-history-enhanced"; then
    ZSH_HISTORY_FILE="$HISTFILE"
    ZSH_HISTORY_FILTER="fzf:peco:percol"
    ZSH_HISTORY_KEYBIND_GET_BY_DIR="^r"
    ZSH_HISTORY_KEYBIND_GET_ALL="^r^a"
fi

# Spaceship Prompt
if zplug check "denysdovhan/spaceship-prompt"; then
    SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    jobs          # Background jobs indicator
    char          # Prompt character
    )

    SPACESHIP_RPROMPT_ORDER=(
    exit_code
    time
    )

    SPACESHIP_TIME_SHOW=true
    SPACESHIP_EXIT_CODE_SHOW=true
    SPACESHIP_PROMPT_SEPARATE_LINE=false
    SPACESHIP_PROMPT_ADD_NEWLINE=true
fi

# History Substring Search
if zplug check "zsh-users/zsh-history-substring-search"; then
    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=9'
fi

# Autosuggestion
if zplug check "zsh-users/zsh-autosuggestions"; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ZSH_AUTOSUGGEST_USE_ASYNC=1
fi

if zplug check "junegunn/fzf"; then
    #source $(brew --prefix)/opt/fzf/shell/completion.zsh

    FZF_DEFAULT_OPTS="
        --extended-exact
        --cycle
        --reverse"

    FZF_DEFAULT_OPTS+="
       --bind pgup:preview-up
       --bind pgdn:preview-down
       --bind ctrl-f:jump
       --bind ctrl-k:kill-line
       --bind ctrl-p:toggle-preview
       --bind ctrl-a:select-all"

    FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

#if zplug check "zsh-users/zsh-syntax-highlighting"; then
#    #ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=red'
#    ZSH_HIGHLIGHT_STYLES[globbing]='fg=green'
#    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
#    ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'
#    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
#fi

zplug check --verbose || zplug install
zplug load

