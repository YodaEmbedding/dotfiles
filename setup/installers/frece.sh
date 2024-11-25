#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

AUTHOR="YodaEmbedding"
PKGNAME="frece"
VERSION=1.0.6

wget -nc -O "$PKGNAME-v$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/archive/refs/tags/v$VERSION.tar.gz"
tar xf "$PKGNAME-v$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

cargo build --release
cp target/release/frece "$HOME/.local/bin"
