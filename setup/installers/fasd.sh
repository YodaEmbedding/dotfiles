#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

FASD_VERSION=1.0.1
wget -nc "https://github.com/clvv/fasd/archive/refs/tags/$FASD_VERSION.tar.gz"
tar xf "$FASD_VERSION.tar.gz"
cd "fasd-$FASD_VERSION" || exit 1
PREFIX=$HOME/.local make install
