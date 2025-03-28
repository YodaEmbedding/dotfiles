#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

AUTHOR="neovim"
PKGNAME="neovim"
VERSION=0.11.0

wget -nc -O "nvim-v$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/v$VERSION.tar.gz"
tar xf "nvim-v$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

printf "%s\n%s\n" "$(tput setaf 2)Please run:" "$(tput setaf 3)sudo apt-get install ninja-build gettext cmake unzip curl build-essential$(tput sgr0)"

make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX="$HOME/.local"
make install

# PYTHON_VERSION=3.9.6
# $HOME/.local/share/python-$PYTHON_VERSION/bin/pip3 install pynvim

# python3 -m pip install pynvim

# git clone --depth 1 https://github.com/wbthomason/packer.nvim \
#   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
