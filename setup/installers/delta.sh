#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

DELTA_VERSION=0.16.5
wget -nc "https://github.com/dandavison/delta/releases/download/$DELTA_VERSION/delta-$DELTA_VERSION-x86_64-unknown-linux-musl.tar.gz"
tar xf "delta-$DELTA_VERSION-x86_64-unknown-linux-musl.tar.gz"
cd "delta-$DELTA_VERSION-x86_64-unknown-linux-musl" || exit 1
mkdir -p "$HOME/.local/bin/"
cp "delta" "$HOME/.local/bin/"
