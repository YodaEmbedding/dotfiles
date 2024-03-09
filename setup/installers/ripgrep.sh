#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

RIPGREP_VERSION=14.0.3
wget -nc "https://github.com/BurntSushi/ripgrep/releases/download/$RIPGREP_VERSION/ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl.tar.gz"
tar xf "ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl.tar.gz"
cd "ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl" || exit 1
mkdir -p "$HOME/.local/bin/"
mkdir -p "$HOME/.local/share/zsh/site-functions/"
mkdir -p "$HOME/.local/share/man/man1/"
cp "rg" "$HOME/.local/bin/"
cp "complete/_rg" "$HOME/.local/share/zsh/site-functions/"
cp "doc/rg.1" "$HOME/.local/share/man/man1/"
