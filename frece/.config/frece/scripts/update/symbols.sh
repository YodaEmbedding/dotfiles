#!/usr/bin/env bash

DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/frece"
DB_FILE="$DATA_DIR/symbols.db"
ENTRIES_FILE="/tmp/frece_symbols_entries.txt"
CUSTOM_ENTRIES_FILE="$DATA_DIR/symbols_custom.txt"
URL="https://gist.githubusercontent.com/YodaEmbedding/e57d9b88bae3bd512d5101a19ebd99b7/raw/968e68cae051839178d677362774b65ed093b62c/latex_unicode_symbols.tsv"

curl -s "$URL" > "$ENTRIES_FILE"

[ ! -d "$DATA_DIR" ] && mkdir -p "$DATA_DIR"

[ -f "$CUSTOM_ENTRIES_FILE" ] && cat "$CUSTOM_ENTRIES_FILE" >> "$ENTRIES_FILE"

if [ ! -f "$DB_FILE" ]; then
    frece init "$DB_FILE" "$ENTRIES_FILE"
else
    frece update "$DB_FILE" "$ENTRIES_FILE" --purge-old
fi
