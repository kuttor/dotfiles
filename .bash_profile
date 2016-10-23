# .dotfiles
source ~/.dotfiles/.functions
source ~/.dotfiles/.aliases
source ~/.dotfiles/.help
source ~/.commacd.bash

# For correcting commands
eval "$(thefuck --alias)"

# Set Blocksize for dd, ls, df, du
export BLOCKSIZE=1k

# Shopt Init
shopt -s autocd

# Bash Completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

# Git Completion
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ [31m$COLORTERM[39;49;00m = gnome-* [04m[31;01m&[39;49;00m[04m[31;01m&[39;49;00m [31m$TERM[39;49;00m = xterm ]] [04m[31;01m&[39;49;00m[04m[31;01m&[39;49;00m infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 [04m[31;01m&[39;49;00m> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	BOLD=""
	RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export BOLD
export RESET

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="⚡ "

export PS1="\[[36m${[39;49;00mMAGENTA[36m}[39;49;00m\]\u \[[31m$RESET[39;49;00m\]in \[[31m$GREEN[39;49;00m\]\w\[[31m$RESET[39;49;00m\]\$([[ -n \$(git branch 2> /dev/null) ]] [04m[31;01m&[39;49;00m[04m[31;01m&[39;49;00m echo \" on \")\[[31m$PURPLE[39;49;00m\]\$(parse_git_branch)\[[31m$RESET[39;49;00m\]\n[31m$symbol[39;49;00m\[[31m$RESET[39;49;00m\]"
export PS2="\[[31m$ORANGE[39;49;00m\]→ \[[31m$RESET[39;49;00m\]"

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;[36m${[39;49;00mPWD[37m##*/[39;49;00m[36m}[39;49;00m\007"'

# init z! (https://github.com/rupa/z)
# . ~/z/z.sh

# Integrate Basher
export PATH="[31m$HOME[39;49;00m/.basher/bin:[31m$PATH[39;49;00m"
eval "$(basher init -)"

# Initializes autoenv
source /usr/local/bin/activate.sh

test -e "[36m${[39;49;00mHOME[36m}[39;49;00m/.iterm2_shell_integration.bash" [04m[31;01m&[39;49;00m[04m[31;01m&[39;49;00m source "[36m${[39;49;00mHOME[36m}[39;49;00m/.iterm2_shell_integration.bash"
