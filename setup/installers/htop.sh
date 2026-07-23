#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

AUTHOR="htop-dev"
PKGNAME="htop"
VERSION=3.4.1
PREFIX="$HOME/.local"

wget -nc -O "$PKGNAME-$VERSION.tar.xz" \
  "https://github.com/$AUTHOR/$PKGNAME/releases/download/$VERSION/$PKGNAME-$VERSION.tar.xz"
tar xf "$PKGNAME-$VERSION.tar.xz"
cd "$PKGNAME-$VERSION" || exit 1

# Use manually installed dependencies (e.g. ncurses) if available.
export PATH="$PREFIX/bin:$PATH"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/lib64/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
export CPPFLAGS="-I$PREFIX/include${CPPFLAGS:+ $CPPFLAGS}"
export LDFLAGS="-L$PREFIX/lib -L$PREFIX/lib64 -Wl,-rpath,$PREFIX/lib -Wl,-rpath,$PREFIX/lib64${LDFLAGS:+ $LDFLAGS}"

./configure --prefix="$PREFIX"

make
make install
