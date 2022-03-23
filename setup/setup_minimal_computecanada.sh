#!/usr/bin/env bash

module load python/3.9.6

./setup/setup_minimal_linux.sh

(cd hosts && stow computecanada-home)
