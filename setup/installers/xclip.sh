#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="astrand"
PKGNAME="xclip"
VERSION=0.13

wget -nc -O "$PKGNAME-$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

autoreconf
./configure --prefix=$HOME/.local || exit 1
make
make install
make install.man

# NOTE: Requires X11 headers to build.
