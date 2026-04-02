#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

AUTHOR="libevent"
PKGNAME="libevent"
VERSION="2.1.12-stable"

wget -nc -O "$PKGNAME-$VERSION.tar.gz" \
  "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/release-$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-release-$VERSION" || exit 1

mkdir -p build
cd build || exit 1

cmake .. -DCMAKE_INSTALL_PREFIX="$HOME/.local"
make
make install

# ./autogen.sh
# ./configure --prefix="$HOME/.local"
# make
# make install
