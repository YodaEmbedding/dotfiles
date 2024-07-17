#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

PKGNAME="ncurses"
VERSION=latest

wget -nc -O "$PKGNAME-$VERSION.tar.gz" "https://invisible-island.net/datafiles/release/$PKGNAME.tar.gz"
rm -rf "$PKGNAME-"*/
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-"*/ || exit 1

./configure --prefix="$HOME/.local"
make
make install
