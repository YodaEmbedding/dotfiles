#!/bin/bash

# SYMLINK

./ln_common.sh

# VIM

mkdir -p ~/.vim/undo

# ZSH

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
git clone https://github.com/zplug/zplug $HOME/.zplug

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
