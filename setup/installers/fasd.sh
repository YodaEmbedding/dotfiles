#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="clvv"
PKGNAME="fasd"
VERSION=1.0.2

wget -nc "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/$VERSION.tar.gz"
tar xf "$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

PREFIX=$HOME/.local make install
