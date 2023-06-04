#!/usr/bin/env bash

DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/frece"
DB_FILE="$DATA_DIR/dir.db"
ENTRIES_FILE="/tmp/frece_dir_entries.txt"
FDIGNORE="${XDG_CONFIG_HOME:-$HOME/.config}/frece/src/dir_fdignore"

append() {
    fd . "$1" -t d --ignore-file="$FDIGNORE" | sort -V >> "$ENTRIES_FILE"
}

true > "$ENTRIES_FILE"
append "$HOME"
append "/mnt/data"
append "/mnt/data3"

if [ ! -f "$DB_FILE" ]; then
    frece init "$DB_FILE" "$ENTRIES_FILE"
else
    frece update "$DB_FILE" "$ENTRIES_FILE" --purge-old
fi
