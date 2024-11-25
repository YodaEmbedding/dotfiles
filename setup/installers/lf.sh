#!/usr/bin/env bash

# Get script's current directory.
pushd "$(dirname $0)" > /dev/null
SCRIPT_DIR="$(pwd)"
popd > /dev/null

source "${SCRIPT_DIR}/_utils.sh" || exit 1
init_install_dir
# determine_arch

AUTHOR="gokcehan"
PKGNAME="lf"
VERSION=31
# ARCH="linux-amd64"

# NOTE: Uses a different naming scheme.
# source "${PWD}/_ARCH.sh"

HW_ARCH="$(uname -m)"

if [ "$HW_ARCH" == "x86_64" ]; then
  ARCH="linux-amd64"
elif [ "$HW_ARCH" == "aarch64" ]; then
  ARCH="android-arm64"
elif [ "$HW_ARCH" == "arm64" ]; then
  ARCH="darwin-arm64"
else
  echo "Unsupported architecture: $HW_ARCH"
  exit 1
fi

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/r$VERSION/$PKGNAME-$ARCH.tar.gz"
tar xf "$PKGNAME-$ARCH.tar.gz"
mkdir -p "$HOME/.local/bin/"
mv "$PKGNAME" "$HOME/.local/bin/"
