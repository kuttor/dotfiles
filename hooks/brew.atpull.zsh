#! /usr/bin/env zsh

cd "$HOME/.local/share/zinit/plugins/brew"
./bin/brew update --preinstall
ln -fs "completions/zsh/_brew" "../../completions/"
./bin/brew shellenv --dummy-arg > brew.zsh
zcompile brew.zsh
source brew.zsh 