#!/bin/bash

./install_stow.sh

stow colors
stow git
stow lint
stow nvim
stow readline
stow tmux
stow vim
stow zsh

mkdir -p ~/.vim/undo

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
