#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="neovim"
PKGNAME="neovim"
VERSION=0.10.0

wget -nc -O "nvim-v$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/v$VERSION.tar.gz"
tar xf "nvim-v$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX="$HOME/.local"
make install

# PYTHON_VERSION=3.9.6
# $HOME/.local/share/python-$PYTHON_VERSION/bin/pip3 install pynvim

# python3 -m pip install pynvim

# git clone --depth 1 https://github.com/wbthomason/packer.nvim \
#   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
