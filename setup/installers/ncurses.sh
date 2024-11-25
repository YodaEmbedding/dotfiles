#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

PKGNAME="ncurses"
VERSION=latest

wget -nc -O "$PKGNAME-$VERSION.tar.gz" "https://invisible-island.net/datafiles/release/$PKGNAME.tar.gz"
rm -rf "$PKGNAME-"*/
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-"*/ || exit 1

./configure --prefix="$HOME/.local"
make
make install
