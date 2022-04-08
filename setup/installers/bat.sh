#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

BAT_VERSION=0.20.0
wget -nc "https://github.com/sharkdp/bat/releases/download/v$BAT_VERSION/bat-v$BAT_VERSION-x86_64-unknown-linux-musl.tar.gz"
tar xf "bat-v$BAT_VERSION-x86_64-unknown-linux-musl.tar.gz"
cd "bat-v$BAT_VERSION-x86_64-unknown-linux-musl" || exit 1
mkdir -p "$HOME/.local/bin/"
mkdir -p "$HOME/.local/share/zsh/site-functions/"
mkdir -p "$HOME/.local/share/man/man1/"
cp "bat" "$HOME/.local/bin/"
cp "autocomplete/bat.zsh" "$HOME/.local/share/zsh/site-functions/"
cp "bat.1" "$HOME/.local/share/man/man1/"
