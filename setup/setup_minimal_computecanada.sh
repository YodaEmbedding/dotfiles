#!/usr/bin/env bash

module load python/3.9.6

./setup/setup_minimal_linux.sh

stow --dir="hosts" --target="$HOME" computecanada-home
