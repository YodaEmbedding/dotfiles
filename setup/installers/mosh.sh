#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

PKGNAME="mosh"
VERSION=1.4.0

wget -nc -O "$PKGNAME-v$VERSION.tar.gz" "https://github.com/mobile-shell/$PKGNAME/releases/download/$PKGNAME-$VERSION/$PKGNAME-$VERSION.tar.gz"
tar xf "$PKGNAME-v$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix="$HOME/.local"
make
make install
