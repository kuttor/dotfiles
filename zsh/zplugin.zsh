#! /usr/bin/env zsh
# -*- coding: utf-8 -*-

# file: zplugin.zsh
# info: Zplugin config file to init, load, and install Zsh/Zplugin plugins
# name: Andrew Kuttor
# mail: andrew.kuttor@gmail.com

# ZPlugin Initiate
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# Compinit speed up loading
ZPLGM[COMPINIT_OPTS]=-C

# Turbo-enabled CompDefs
autoload -Uz compinit && compinit
zplugin cdreplay -q
zplugin cdlist

# Theme
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# Zsh-Completions: Various Command Completions
zplugin ice wait"0" lucid blockf
zplugin light zsh-users/zsh-completions

# Zsh-Autosuggestions: Because They're Damn Cool
zplugin ice wait"0" lucid atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

# Git: Oh-My-Zsh Version
zplugin ice svn pick"completion.zsh" src"git.zsh"
zplugin snippet OMZ::lib

# Bat: Syntax-Highlighted Cat Replacement
zplugin ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat"
zplugin light sharkdp/bat

# RipGrep: Supercharged Grep Replacement
zplugin ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zplugin light BurntSushi/ripgrep

# Neovim: Vim Replacement
zplugin ice from"gh-r" as"program" bpick"*appimage*" mv"nvim* -> nvim" pick"nvim"
zplugin light neovim/neovim

# Exa: LS Replacement
zplugin ice from"gh-r" as"program" bpick"*linux-x86_64*" mv"exa* -> exa" pick"exa"
zplugin light ogham/exa

# Fd: Find Replacement
zplugin ice from"gh-r" as"program" mv"fd* -> fd" pick"fd/fd"; zplugin light sharkdp/fd
zplg ice depth'1' blockf

# Syntax highlighter: Speed Enhanced
zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# LS_Colors: Trapd00r-Style Shell Coloring
zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zplugin light trapd00r/LS_COLORS

# Z: Directory Jumper
zplugin ice lucid wait"0"
zplugin light agkozak/zsh-z

# FZF: Fuzzy Finder
zplugin ice from"gh-r" as"program"
zplugin lad junegunn/fzf-bin

# FZF-Z: FZF Powered Z Completions
zplugin ice wait lucid
zplugin light andrewferrier/fzf-z

# FZ: Z Tab-Completions
zplugin ice wait"!0"
zplugin light changyuheng/fz

# Pip Completion: Oh-My-Zsh Version
zplugin ice svn pick"completion.zsh" src"git.zsh"
zplugin snippet OMZ::lib