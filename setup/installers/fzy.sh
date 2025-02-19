#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

AUTHOR="jhawthorn"
PKGNAME="fzy"
VERSION=1.0

wget -nc \
  "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/$VERSION.tar.gz" \
  -O "$PKGNAME-$VERSION.tar.gz"
mkdir -p "$PKGNAME-$VERSION"
tar xf "$PKGNAME-$VERSION.tar.gz" -C "$PKGNAME-$VERSION"
cd "$PKGNAME-$VERSION/$PKGNAME-$VERSION" || exit 1

PREFIX=$HOME/.local make install
