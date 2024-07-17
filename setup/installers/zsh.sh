#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

PKGNAME="zsh"
VERSION=latest

wget -nc -O "$PKGNAME-$VERSION.tar.xz" "https://sourceforge.net/projects/zsh/files/latest/download"
rm -rf "$PKGNAME-$VERSION"/
mkdir "$PKGNAME-$VERSION" && unxz "$PKGNAME-$VERSION.tar.xz" && tar -xvf "$PKGNAME-$VERSION.tar" -C "$PKGNAME-$VERSION" --strip-components 1
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix="$HOME/.local"
make
make install
