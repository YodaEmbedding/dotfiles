#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

GETTEXT_VERSION=0.21
wget -nc "https://ftp.gnu.org/gnu/gettext/gettext-$GETTEXT_VERSION.tar.gz"
tar xf "gettext-$GETTEXT_VERSION.tar.gz"
cd "gettext-$GETTEXT_VERSION" || exit 1
./configure --prefix=$HOME/.local
make install
