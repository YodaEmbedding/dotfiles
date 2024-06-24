#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

PKGNAME="gettext"
VERSION=0.21

wget -nc "https://ftp.gnu.org/gnu/$PKGNAME/$PKGNAME-$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix=$HOME/.local
make install
