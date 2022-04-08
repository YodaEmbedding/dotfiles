#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

DELTA_VERSION=0.20.0
https://github.com/dandavison/delta/releases/download/0.12.1/delta-0.12.1-x86_64-unknown-linux-gnu.tar.gz
wget -nc "https://github.com/dandavison/delta/releases/download/$DELTA_VERSION/delta-$DELTA_VERSION-x86_64-unknown-linux-gnu.tar.gz"
tar xf "delta-$DELTA_VERSION-x86_64-unknown-linux-gnu.tar.gz"
cd "delta-$DELTA_VERSION-x86_64-unknown-linux-gnu" || exit 1
mkdir -p "$HOME/.local/bin/"
cp "delta" "$HOME/.local/bin/"
