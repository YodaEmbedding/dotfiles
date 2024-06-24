#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="gokcehan"
PKGNAME="lf"
VERSION=31
ARCH="linux-amd64"

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/r$VERSION/$PKGNAME-$ARCH.tar.gz"
tar xf "$PKGNAME-$ARCH.tar.gz"
mkdir -p "$HOME/.local/bin/"
mv "$PKGNAME" "$HOME/.local/bin/"
