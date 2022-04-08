#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

FD_VERSION=8.3.2
wget -nc "https://github.com/sharkdp/fd/releases/download/v$FD_VERSION/fd-v$FD_VERSION-x86_64-unknown-linux-gnu.tar.gz"
tar xf "fd-v$FD_VERSION-x86_64-unknown-linux-gnu.tar.gz"
cd "fd-v$FD_VERSION-x86_64-unknown-linux-gnu" || exit 1
mkdir -p "$HOME/.local/bin/"
mkdir -p "$HOME/.local/share/zsh/site-functions/"
mkdir -p "$HOME/.local/share/man/man1/"
cp "fd" "$HOME/.local/bin/"
cp "autocomplete/_fd" "$HOME/.local/share/zsh/site-functions/"
cp "fd.1" "$HOME/.local/share/man/man1/"
