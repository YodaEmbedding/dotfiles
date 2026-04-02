#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

AUTHOR="tmux"
PKGNAME="tmux"
VERSION=3.5a
PREFIX="$HOME/.local"

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/$VERSION/$PKGNAME-$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

# Use manually installed dependencies (e.g. libevent, ncurses) if available.
export PATH="$PREFIX/bin:$PATH"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/lib64/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
export CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/ncursesw${CPPFLAGS:+ $CPPFLAGS}"
export LDFLAGS="-L$PREFIX/lib -L$PREFIX/lib64 -Wl,-rpath,$PREFIX/lib -Wl,-rpath,$PREFIX/lib64${LDFLAGS:+ $LDFLAGS}"
export LIBS="-lutil${LIBS:+ $LIBS}"

./configure --prefix="$PREFIX"

make
make install

# Library dependencies: libevent, ncurses
# Make dependencies: C compiler, make, yacc (or bison), pkg-config
