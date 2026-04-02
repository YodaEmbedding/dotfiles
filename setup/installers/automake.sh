#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir

PKGNAME="automake"
VERSION=1.16.5

wget -nc "https://ftp.gnu.org/gnu/$PKGNAME/$PKGNAME-$VERSION.tar.gz"
tar xf "$PKGNAME-$VERSION.tar.gz"
cd "$PKGNAME-$VERSION" || exit 1

./configure --prefix=$HOME/.local

# Fixes:
# help2man: can't get `--help' info from automake-1.16
# Try `--no-discard-stderr' if option outputs to stderr
sed -i 's/help2man/help2man --no-discard-stderr/g' Makefile

make
make install
