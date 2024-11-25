#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

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
