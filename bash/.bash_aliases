#!/bin/bash

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
<<<<<<< HEAD
alias graphic_card="lspci -vnn | grep -i VGA -A 12"

=======
>>>>>>> eaa971907273f24e4b0bbcd8e698bcb737351119

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
<<<<<<< HEAD
alias ipre='more'
=======
alias ,ipre='more'
>>>>>>> eaa971907273f24e4b0bbcd8e698bcb737351119
alias sl='ls'
alias srln='slrn'
