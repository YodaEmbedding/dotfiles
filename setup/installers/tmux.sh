#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="tmux"
PKGNAME="tmux"
VERSION=3.5a

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/$VERSION/$PKGNAME-$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix=$HOME/.local
make install

# Library dependencies: libevent, ncurses
# Make dependencies: C compiler, make, yacc (or bison), pkg-config
