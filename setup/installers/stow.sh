#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

PKGNAME="stow"
VERSION=2.3.1

wget -nc "https://ftp.gnu.org/gnu/$PKGNAME/$PKGNAME-$VERSION.tar.gz"
[[ -f "$PKGNAME-$VERSION.tar.gz" ]] || exit 1
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix="$HOME/.local" \
    --datarootdir="${XDG_DATA_HOME:-$HOME/.local/share}/$PKGNAME"

make
make install
