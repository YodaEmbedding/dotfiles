#!/usr/bin/env bash

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit 1

CMAKE_VERSION=3.23.1
wget -nc "https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION.tar.gz"
tar xf "cmake-$CMAKE_VERSION.tar.gz"
cd "cmake-$CMAKE_VERSION" || exit 1
./configure --prefix=$HOME/.local
make install
