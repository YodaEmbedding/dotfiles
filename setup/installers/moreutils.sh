#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname "$0")" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

PKGNAME="moreutils"
VERSION=0.70

wget -nc "https://deb.debian.org/debian/pool/main/m/$PKGNAME/${PKGNAME}_${VERSION}.orig.tar.xz"
tar xf "${PKGNAME}_${VERSION}.orig.tar.xz"
cd "$PKGNAME-$VERSION" || exit 1

make errno ifdata ifne isutf8 lckdo mispipe parallel pee sponge

mkdir -p "$HOME/.local/bin"
install errno ifdata ifne isutf8 lckdo mispipe parallel pee sponge "$HOME/.local/bin"
install chronic combine ts vidir vipe zrun "$HOME/.local/bin"
