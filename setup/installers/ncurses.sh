#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

PKGNAME="ncurses"
VERSION=latest

wget -nc -O "$PKGNAME-$VERSION.tar.gz" "https://invisible-island.net/datafiles/release/$PKGNAME.tar.gz"
rm -rf "$PKGNAME-"*/
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-"*/ || exit 1

./configure --prefix="$HOME/.local" --with-shared --with-termlib --enable-widec --enable-overwrite
make
make install

# Provide non-wide compatibility names expected by some build scripts.
ln -sf "$HOME/.local/lib/libncursesw.so" "$HOME/.local/lib/libncurses.so"
ln -sf "$HOME/.local/lib/libtinfow.so" "$HOME/.local/lib/libtinfo.so"

# Don't override system tput, etc.
mv "$HOME/.local/bin/tput" "$HOME/.local/bin/tput.local"
mv "$HOME/.local/bin/tabs" "$HOME/.local/bin/tabs.local"
mv "$HOME/.local/bin/clear" "$HOME/.local/bin/clear.local"
mv "$HOME/.local/bin/tset" "$HOME/.local/bin/tset.local"
mv "$HOME/.local/bin/reset" "$HOME/.local/bin/reset.local"
hash -r
