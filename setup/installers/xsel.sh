#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

AUTHOR="kfish"
PKGNAME="xsel"
VERSION=1.2.1

wget -nc -O "$PKGNAME-$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./autogen.sh
./configure --prefix=$HOME/.local || exit 1
make install

# NOTE: Requires X11 headers to build.
