#!/bin/bash

mkdir -p "%USERPROFILE%/.vim/undo"
mkdir -p "%USERPROFILE%/AppData/Local/nvimta/Local/nvim"
echo "source ~/dotfiles/vim/.vimrc" >> "%USERPROFILE%/.vimrc"
echo "source ~/dotfiles/vim/.vimrc" >> "%USERPROFILE%/AppData/Local/nvim/init.vim"
bash ln_common.sh
