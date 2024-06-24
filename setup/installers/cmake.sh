#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="Kitware"
PKGNAME="cmake"
VERSION=3.23.1

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/v$VERSION/$PKGNAME-$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix=$HOME/.local
make install
