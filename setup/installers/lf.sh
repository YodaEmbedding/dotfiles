#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="gokcehan"
PKGNAME="lf"
VERSION=31
ARCH="linux-amd64"

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
