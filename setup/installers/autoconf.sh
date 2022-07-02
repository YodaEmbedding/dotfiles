#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTOCONF_VERSION=2.71
wget -nc "https://ftp.gnu.org/gnu/autoconf/autoconf-$AUTOCONF_VERSION.tar.gz"
tar xf "autoconf-$AUTOCONF_VERSION.tar.gz"
cd "autoconf-$AUTOCONF_VERSION" || exit 1
./configure --prefix=$HOME/.local
make install
