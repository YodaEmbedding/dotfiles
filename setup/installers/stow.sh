#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

PKGNAME="stow"
VERSION=2.3.1

wget -nc "https://ftp.gnu.org/gnu/$PKGNAME/$PKGNAME-$VERSION.tar.gz"
[[ -f "$PKGNAME-$VERSION.tar.gz" ]] || exit 1
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix="$HOME/.local" \
    --datarootdir="${XDG_DATA_HOME:-$HOME/.local/share}/$PKGNAME"

make
make install
