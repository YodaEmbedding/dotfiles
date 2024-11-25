#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir
determine_arch

AUTHOR="BurntSushi"
PKGNAME="ripgrep"
VERSION=14.0.3
# ARCH="x86_64-unknown-linux-musl"

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/$VERSION/$PKGNAME-$VERSION-$ARCH.tar.gz"
tar xf "$PKGNAME-$VERSION-$ARCH.tar.gz"
cd "$PKGNAME-$VERSION-$ARCH" || exit 1

mkdir -p "$HOME/.local/bin/"
mkdir -p "$HOME/.local/share/zsh/site-functions/"
mkdir -p "$HOME/.local/share/man/man1/"
cp "rg" "$HOME/.local/bin/"
cp "complete/_rg" "$HOME/.local/share/zsh/site-functions/"
cp "doc/rg.1" "$HOME/.local/share/man/man1/"
