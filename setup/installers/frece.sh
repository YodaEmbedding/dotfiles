#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="YodaEmbedding"
PKGNAME="frece"
VERSION=1.0.6

wget -nc -O "$PKGNAME-v$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/v$VERSION.tar.gz"
tar xf "$PKGNAME-v$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

cargo build --release
cp target/release/frece "$HOME/.local/bin"
