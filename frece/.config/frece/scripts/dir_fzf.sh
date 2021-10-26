#!/usr/bin/env bash

DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/frece"
DB_FILE="$DATA_DIR/dir.db"

item=$(frece print "$DB_FILE" | fzf "$@")
[[ -z $item ]] && exit 1
frece increment "$DB_FILE" "$item"

echo "$item"
