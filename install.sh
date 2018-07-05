#! /usr/local/bin/bash

#
# Name: Andrew 'Yeti' Kuttor
# Mail: andrew.kuttor@gmail.com
# Info: Installs and configures dotfiles
#

# Exa: Modern LS
brew install exa

# RipGrep: Modern Grep
brew install ripgrep

# Hub: Git additions
brew install hub

# CoreUtils: Contains GNU alternatives
brew install coreutils

# The Silver Searcher: Required for VIM config
brew install the_silver_searcher

# Bash-Git-Prompt: Sexy Prompt
git clone \
  https://github.com/magicmonty/bash-git-prompt.git \
  .bash-git-prompt \
  --depth=1


