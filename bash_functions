#!/usr/bin/env bash

# Author: Andrew Kuttor
# E-mail: andrew.kuttor@gmail.com

# =============================================================================
# Functions
# =============================================================================

mcd(){ mkdir -p $1 && cd $1; }                            # make/cd to folder
rsed(){ find . -type f -exec sed "$@" {} \+ ;}            # recursive sed
dug(){ dig +nocmd $1 any +multiline +noall +answer ;}     # better dig
backup(){ cp -p $@{,.backup$(date '+%Y%m%dx')} ;}         # easy backup
httpHeaders () { curl -I -L $@ ;}                         # get HTTP headers
lx(){ tree -L 1 -Ccfhau --du --dirsfirst $@ ;}            # better ls
trash() { mv $@ "$HOME/.Trash" ;}                         # easy backup
zed(){ sed -i -e "s/$1/$2/g" $3 ;}                        # easy send

# Multi-format unarchiver
extract() {
    if [ -f $1 ]; then 
        case $1 in
          *.tar.bz2)   tar xjf $1     ;;
          *.tar.gz)    tar xzf $1     ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar e $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xf $1      ;;
          *.tbz2)      tar xjf $1     ;;
          *.tgz)       tar xzf $1     ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "$1 " ;;
      esac
  else
      echo "Incompatible archive: $1"
  fi
}

# Allow global pip package installations
# gpip() { PIP_REQUIRE_VIRTUALENV="" pip "$@" ;}

# alias last and save
# use `als c NAME` to chop off the last argument (for filenames/patterns)
als() {
	local aliasfile chop x
	[[ $# == 0 ]] && echo "Name your alias" && return
	if [[ $1 == "c" ]]; then
		chop=true
		shift
	fi
	aliasfile=~/.bash_it/aliases/custom.aliases.bash
	touch $aliasfile
	if [[ `cat "$aliasfile" |grep "alias ${1// /}="` != "" ]]; then
		echo "Alias ${1// /} already exists"
	else
		x=`history 2 | sed -e '$!{h;d;}' -e x | sed -e 's/.\{7\}//'`
		if [[ $chop == true ]]; then
			echo "Chopping..."
			x=$(echo $x | rev | cut -d " " -f2- | rev)
		fi
		echo -e "\nalias ${1// /}=\"`echo $x|sed -e 's/ *$//'|sed -e 's/\"/\\\\"/g'`\"" >> $aliasfile && source $aliasfile
		alias $1
	fi
}
