#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

PKGNAME="zsh"
VERSION=latest

wget -nc -O "$PKGNAME-$VERSION.tar.xz" "https://sourceforge.net/projects/zsh/files/latest/download"
rm -rf "$PKGNAME-$VERSION"/
mkdir "$PKGNAME-$VERSION" && unxz "$PKGNAME-$VERSION.tar.xz" && tar -xvf "$PKGNAME-$VERSION.tar" -C "$PKGNAME-$VERSION" --strip-components 1
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix="$HOME/.local"
make
make install
