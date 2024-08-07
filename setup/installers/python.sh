#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

VERSION=3.9.6
VERSION_XY=3.9

wget -nc "https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz"
tar xf "Python-$VERSION.tgz"
cd "Python-$VERSION" || exit 1

./configure --prefix=$HOME/.local/share/python-$VERSION
make
make install

# Create symlinks in ~/.local/bin
# TODO Perhaps a better alternative would be just to prepend to system PATH...?
for f in $HOME/.local/share/python-$VERSION/bin/*$VERSION_XY; do
  ln -s "$f" "$HOME/.local/bin/${${$(basename "$f")%$VERSION_XY}%-}"
done
