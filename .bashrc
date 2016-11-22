# .dotfiles
source ~/.dotfiles/.awsrc
source ~/.dotfiles/.functions
source ~/.dotfiles/.aliases

# Outputs all arguments of target script to stderr
yell() {
  echo "$0: $*" >&2; 
}

# Does the same as yell, but exits with a non-0 exit status, which means fail
die() { yell "$*"; exit 111; }

# Uses the || (boolean OR), which only evaluates the right side if the left one
try() { "$@" || die "cannot $*"; }



# Set default editor
export EDITOR='sublime --wait'

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
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
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

export PS1="\[$GREEN\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# init z! (https://github.com/rupa/z)
# . ~/z/z.sh

# Integrate Basher
export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init -)"

# Initializes autoenv
source /usr/local/bin/activate.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# FZF Integration
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# MOTD
/usr/local/bin/fortune -a -o 
