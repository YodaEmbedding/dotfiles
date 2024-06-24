#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="dandavison"
PKGNAME="delta"
VERSION=0.16.5
ARCH="x86_64-unknown-linux-musl"

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/$VERSION/$PKGNAME-$VERSION-$ARCH.tar.gz"
tar xf "$PKGNAME-$VERSION-$ARCH.tar.gz"
cd "$PKGNAME-$VERSION-$ARCH" || exit 1

mkdir -p "$HOME/.local/bin/"
cp "$PKGNAME" "$HOME/.local/bin/"
