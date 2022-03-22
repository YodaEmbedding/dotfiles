#!/usr/bin/env bash

./install_stow.sh

stow colors
stow git
stow lint
stow nvim
stow readline
stow tmux
stow vim
stow zsh

mkdir -p ~/.vim/undo

TMP_DIR="$HOME/.dotfiles_tmp_install"
mkdir -p "$TMP_DIR"
cd "$TMP_DIR"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -sS https://webinstall.dev/zoxide | bash

FASD_VERSION=1.0.1
cd "$TMP_DIR"
wget -nc "https://github.com/clvv/fasd/archive/refs/tags/$FASD_VERSION.tar.gz"
tar xf "$FASD_VERSION.tar.gz"
cd "fasd-$FASD_VERSION"
PREFIX=$HOME/.local make install

NVIM_VERSION=0.5.0
cd "$TMP_DIR"
wget -nc "https://github.com/neovim/neovim/archive/refs/tags/v$NVIM_VERSION.tar.gz"
tar xf "v$NVIM_VERSION.tar.gz"
cd "neovim-$NVIM_VERSION"
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$HOME/.local
make install

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

PYTHON_VERSION=3.9.6
cd "$TMP_DIR"
wget -nc "https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz"
tar xf "Python-$PYTHON_VERSION.tgz"
cd "Python-$PYTHON_VERSION"
./configure --prefix=$HOME/.local/share/python-$PYTHON_VERSION
make
make install

for f in $HOME/.local/share/python-$PYTHON_VERSION/bin/*3.9; do
    ln -s "$f" "$HOME/.local/bin/${${$(basename "$f")%3.9}%-}"
done

$HOME/.local/share/python-$PYTHON_VERSION/bin/pip3 install pynvim
