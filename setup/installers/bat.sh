#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

AUTHOR="sharkdp"
PKGNAME="bat"
VERSION=0.24.0
ARCH="x86_64-unknown-linux-musl"

wget -nc "https://github.com/$AUTHOR/$PKGNAME/releases/download/v$VERSION/$PKGNAME-v$VERSION-$ARCH.tar.gz"
tar xf "$PKGNAME-v$VERSION-$ARCH.tar.gz"
cd "$PKGNAME-v$VERSION-$ARCH" || exit 1

mkdir -p "$HOME/.local/bin/"
mkdir -p "$HOME/.local/share/zsh/site-functions/"
mkdir -p "$HOME/.local/share/man/man1/"
cp "$PKGNAME" "$HOME/.local/bin/"
cp "autocomplete/$PKGNAME.zsh" "$HOME/.local/share/zsh/site-functions/"
cp "$PKGNAME.1" "$HOME/.local/share/man/man1/"
