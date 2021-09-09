#!/bin/sh

STOW_VERSION=2.3.1

wget -nc "https://ftp.gnu.org/gnu/stow/stow-$STOW_VERSION.tar.gz"
[[ -f "stow-$STOW_VERSION.tar.gz" ]] || exit
tar xf "stow-$STOW_VERSION.tar.gz"
cd "stow-$STOW_VERSION"

./configure --prefix="$HOME/.local" \
    --datarootdir="${XDG_DATA_HOME:-$HOME/.local/share}/stow"

make
make install
