#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

AUTHOR="clvv"
PKGNAME="fasd"
VERSION=1.0.2

wget -nc "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/$VERSION.tar.gz"
tar xf "$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

PREFIX=$HOME/.local make install
