#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTOMAKE_VERSION=1.16.5
wget -nc "https://ftp.gnu.org/gnu/automake/automake-$AUTOMAKE_VERSION.tar.gz"
tar xf "automake-$AUTOMAKE_VERSION.tar.gz"
cd "automake-$AUTOMAKE_VERSION" || exit 1
./configure --prefix=$HOME/.local
make install
