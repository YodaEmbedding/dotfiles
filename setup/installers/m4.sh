#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

M4_VERSION=1.4.19
wget -nc "https://ftp.gnu.org/gnu/m4/m4-$M4_VERSION.tar.gz"
tar xf "m4-$M4_VERSION.tar.gz"
cd "m4-$M4_VERSION" || exit 1
./configure --prefix=$HOME/.local
make install
