#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"

./setup/installers/stow.sh
./setup/installers/fzf.sh
./setup/installers/zoxide.sh
./setup/installers/fasd.sh
# ./setup/installers/python.sh
./setup/installers/python_packages.sh
./setup/installers/fd.sh
./setup/installers/lf.sh
./setup/installers/nvim.sh
./setup/installers/ripgrep.sh

stow aliases
stow colors
stow git
stow lint
stow nvim
stow ptpython
stow readline
stow ripgrep
stow snippets
stow tmux
stow vim
stow zsh
