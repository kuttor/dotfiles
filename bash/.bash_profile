#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# Bash 4 Features
#------------------------------------------------------------------------------

shopt -s autocd     # Auto cd when navigating file system
shopt -s nocaseglob # Case in-sensitive globbing
shopt -s histappend # Append to history
shopt -s cdspell    # Autocorrect typos in path when using cd


#-------------------------------------------------------------------------------
# Completions
#-------------------------------------------------------------------------------

alias completions='complete -p | less' # List all completions

# SSH hostnames completions based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config"  ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;


#-------------------------------------------------------------------------------
# Pretty Lights
#-------------------------------------------------------------------------------

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then
    colorflag="--color" # GNU `ls`
else
    colorflag="-G" # OS X `ls`
fi

# Color configuration
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}"

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

#-------------------------------------------------------------------------------
# History
#-------------------------------------------------------------------------------

# Increase Bash history size. Allow 32Â³ entries; the default is 500.
export HISTSIZE='32768'

export HISTFILESIZE="${HISTSIZE}"

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth'


