#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

PKG_AUTHOR=jhawthorn
PKG_NAME=fzy
PKG_VERSION=1.0
wget -nc \
  "https://github.com/$PKG_AUTHOR/$PKG_NAME/archive/refs/tags/$PKG_VERSION.tar.gz" \
  -O "$PKG_NAME-$PKG_VERSION.tar.gz"
mkdir -p "$PKG_NAME-$PKG_VERSION"
tar xf "$PKG_NAME-$PKG_VERSION.tar.gz" -C "$PKG_NAME-$PKG_VERSION"
cd "$PKG_NAME-$PKG_VERSION" || exit 1
PREFIX=$HOME/.local make install
