#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

PYTHON_VERSION=3.9.6
PYTHON_VERSION_XY=3.9
wget -nc "https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz"
tar xf "Python-$PYTHON_VERSION.tgz"
cd "Python-$PYTHON_VERSION" || exit 1
./configure --prefix=$HOME/.local/share/python-$PYTHON_VERSION
make
make install

# Create symlinks in ~/.local/bin
# TODO Perhaps a better alternative would be just to prepend to system PATH...?
for f in $HOME/.local/share/python-$PYTHON_VERSION/bin/*$PYTHON_VERSION_XY; do
  ln -s "$f" "$HOME/.local/bin/${${$(basename "$f")%$PYTHON_VERSION_XY}%-}"
done
