#!/usr/bin/env zsh

# Aliases for both Bash and Zsh.

# By: Andrew Kuttor
# Contact: andrew.kuttor@gmail.com

#------------------------------------------------------------------------------
# Aliases
#------------------------------------------------------------------------------

alias df='df -hi'
alias du='du -h'
alias rm='rm -ii'
alias ssh_host_list='grep "^Host" $HOME/.ssh/config | awk "{print $2}"'
alias pip-upgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
# alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias ports='netstat -lantip'
alias c='pygmentize -O style=monokai -f console256 -g'
alias tn='tr -d "\n"'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
alias keycode="sed -n l"
alias awl="awless"
alias swap="asp"
alias path='echo $PATH | tr -s ":" "\n"'
alias less='less +g -RSC~'
alias quit='exit'

# Detect ls flavor for highlighting
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Activate pretty lights
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Navigation
alias ls='ls -alFh --time-style=long-iso --color=auto'
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'" # List dirs only

# Typos
alias dior='dir'
alias dire='dir'
alias dor='dir'
alias die='dir'
alias doe='dir'
alias dur='dir'
alias mroe='more'
alias pcio='pico'
alias pciop='pico'
alias pin='pine'
alias pnie='pine'
alias ,ipre='more'
alias sl='ls'
alias srln='slrn'
