#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="jhawthorn"
PKGNAME="fzy"
VERSION=1.0

wget -nc \
  "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/$VERSION.tar.gz" \
  -O "$PKGNAME-$VERSION.tar.gz"
mkdir -p "$PKGNAME-$VERSION"
tar xf "$PKGNAME-$VERSION.tar.gz" -C "$PKGNAME-$VERSION"
cd "$PKGNAME-$VERSION" || exit 1

PREFIX=$HOME/.local make install
