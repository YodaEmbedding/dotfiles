#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"

./setup/installers/m4.sh
./setup/installers/autoconf.sh
./setup/installers/automake.sh
./setup/installers/gettext.sh
./setup/installers/cmake.sh

./setup/setup_minimal_linux.sh

stow --dir="hosts" --target="$HOME" idcc-node-linux-home
