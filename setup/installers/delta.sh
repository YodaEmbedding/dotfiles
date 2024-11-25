#!/usr/bin/env bash

# Save script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="dandavison"
PKGNAME="delta"
VERSION=0.16.5
ARCH="x86_64-unknown-linux-musl"
source "${SCRIPT_DIR}/_ARCH.sh"

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/$VERSION/$PKGNAME-$VERSION-$ARCH.tar.gz"
tar xf "$PKGNAME-$VERSION-$ARCH.tar.gz"
cd "$PKGNAME-$VERSION-$ARCH" || exit 1

mkdir -p "$HOME/.local/bin/"
cp "$PKGNAME" "$HOME/.local/bin/"
