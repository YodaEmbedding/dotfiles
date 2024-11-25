#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

PKGNAME="mosh"
VERSION=1.4.0

wget -nc -O "$PKGNAME-v$VERSION.tar.gz" "https://github.com/mobile-shell/$PKGNAME/releases/download/$PKGNAME-$VERSION/$PKGNAME-$VERSION.tar.gz"
tar xf "$PKGNAME-v$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix="$HOME/.local"
make
make install
