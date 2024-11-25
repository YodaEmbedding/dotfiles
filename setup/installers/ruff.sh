#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir
determine_arch

AUTHOR="astral-sh"
PKGNAME="ruff"
VERSION=0.3.1
# ARCH="x86_64-unknown-linux-musl"

# wget -nc -O "$PKGNAME-v$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/releases/download/$PKGNAME-$VERSION/$PKGNAME-$VERSION.tar.gz"
# tar xf "$PKGNAME-v$VERSION.tar.gz"
# cd "$PKGNAME-$VERSION" || exit 1

wget -nc -O "$PKGNAME-v$VERSION.tar.gz" "https://github.com/$AUTHOR/$PKGNAME/releases/download/v$VERSION/$PKGNAME-$VERSION-$ARCH.tar.gz"
tar xf "$PKGNAME-v$VERSION.tar.gz"

mkdir -p "$HOME/.local/bin"
mv "$PKGNAME" "$HOME/.local/bin/"
