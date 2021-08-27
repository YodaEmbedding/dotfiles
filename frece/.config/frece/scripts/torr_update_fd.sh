#!/bin/bash

DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/frece"
DB_FILE="$DATA_DIR/torr.db"
ENTRIES_FILE="/tmp/frece_torr_entries.txt"
FDIGNORE="${XDG_CONFIG_HOME:-$HOME/.config}/frece/src/torr_fdignore"

append() {
    fd . "$1" -t f --ignore-file="$FDIGNORE" | sort -V >> "$ENTRIES_FILE"
}

true > "$ENTRIES_FILE"
append "/mnt/data3/Torrents"

if [ ! -f "$DB_FILE" ]; then
    frece init "$DB_FILE" "$ENTRIES_FILE"
else
    frece update "$DB_FILE" "$ENTRIES_FILE" --purge-old
fi
