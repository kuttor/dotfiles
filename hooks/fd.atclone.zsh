#!/usr/bin/env zsh
# -*- coding: utf-8 -*-
#vim:set filetype=zsh syntax=zsh

mv -vf fd-*/autocomplete/_fd _fd
mv -vf fd-*/fd.1 ${ZINIT[MAN_DIR]}/man1

zinit creinstall -q fd
