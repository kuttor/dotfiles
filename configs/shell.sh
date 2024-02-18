#! /usr/bin/env sh
# Vim:set filtype=sh syntax=sh

# If we are not running interactively do not continue loading this file.
case $- in
    *i*) ;;
      *) return;;
esac

# Ctrl+S to forward search
stty -ixon

# Set our preferred editor to the first available editor in the array below.
for EDITOR in nvim vim vi nano; do
    if command -v "${EDITOR}" >/dev/null 2>&1; then
        VISUAL="$(command -v "${EDITOR}")"
        EDITOR="${VISUAL}"
        break
    fi
done
unset editor preferred_editors

# Set a shell option but don't fail if it doesn't exist!
safe_set() { shopt -s "$1" >/dev/null 2>&1 || true; }

# terminal and older shells might not have these options.
safe_set autocd         # Enter a folder name to 'cd' to it.
safe_set cdspell        # Fix minor spelling issues with 'cd'.
safe_set dirspell       # Fix minor spelling issues for commands.
safe_set cdable_vars    # Allow 'cd varname' to switch directory.

# Configure the history to make it large and support multi-line commands.
safe_set histappend                  # Don't overwrite the history file, append.
safe_set cmdhist                     # Multi-line commands are one entry only.
PROMPT_COMMAND='history -a'          # Before we prompt, save the history.
HISTSIZE=10000                       # A large number of commands per session.
HISTFILESIZE=100000                  # A huge number of commands in the file.
