#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="kfish"
PKGNAME="xsel"
VERSION=1.2.1

wget -nc -O "$PKGNAME-$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./autogen.sh
./configure --prefix=$HOME/.local || exit 1
make install

# NOTE: Requires X11 headers to build.
