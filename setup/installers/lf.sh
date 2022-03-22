#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

LF_VERSION=26
wget -nc "https://github.com/gokcehan/lf/releases/download/r$LF_VERSION/lf-linux-amd64.tar.gz"
tar xf "lf-linux-amd64.tar.gz"
mkdir -p "$HOME/.local/bin/"
mv "lf" "$HOME/.local/bin/"
