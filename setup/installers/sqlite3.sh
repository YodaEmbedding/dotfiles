#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir
# determine_arch

AUTHOR=""
PKGNAME="sqlite-tools"
VERSION=3470100
ARCH="linux-x64"

wget -nc "https://www.sqlite.org/2024/$PKGNAME-$ARCH-$VERSION.zip"
unzip "$PKGNAME-$ARCH-$VERSION.zip"
cd "$PKGNAME-$ARCH-$VERSION" || exit 1

mkdir -p "$HOME/.local/bin/"
cp sqldiff "$HOME/.local/bin/"
cp sqlite3 "$HOME/.local/bin/"
cp sqlite3_analyzer "$HOME/.local/bin/"
cp sqlite3_rsync "$HOME/.local/bin/"
