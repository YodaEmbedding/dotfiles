#!/bin/sh

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

STOW_VERSION=2.3.1
wget -nc "https://ftp.gnu.org/gnu/stow/stow-$STOW_VERSION.tar.gz"
[[ -f "stow-$STOW_VERSION.tar.gz" ]] || exit 1
tar xf "stow-$STOW_VERSION.tar.gz"
cd "stow-$STOW_VERSION" || exit 1

./configure --prefix="$HOME/.local" \
    --datarootdir="${XDG_DATA_HOME:-$HOME/.local/share}/stow"

make
make install
