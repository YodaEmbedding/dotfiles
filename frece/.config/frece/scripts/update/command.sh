#!/usr/bin/env bash

DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/frece"
DB_FILE="$DATA_DIR/command.db"
CUSTOM_ENTRIES_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/frece/src/command_custom.txt"

if [ ! -f "$DB_FILE" ]; then
    frece init "$DB_FILE" "$CUSTOM_ENTRIES_FILE"
else
    frece update "$DB_FILE" "$CUSTOM_ENTRIES_FILE" --purge-old
fi
