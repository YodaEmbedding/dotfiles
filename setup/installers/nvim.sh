#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

NVIM_VERSION=0.9.5
wget -nc -O "nvim-v$NVIM_VERSION.tar.gz" "https://github.com/neovim/neovim/archive/refs/tags/v$NVIM_VERSION.tar.gz"
tar xf "nvim-v$NVIM_VERSION.tar.gz"
cd "neovim-$NVIM_VERSION" || exit 1
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX="$HOME/.local"
make install

# PYTHON_VERSION=3.9.6
# $HOME/.local/share/python-$PYTHON_VERSION/bin/pip3 install pynvim

python3 -m pip install pynvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
