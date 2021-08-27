#!/bin/bash

DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/frece"
DB_FILE="$DATA_DIR/command.db"

item=$(frece print --sort=recency "$DB_FILE" | head -n 1)
[[ -z $item ]] && exit 1
frece increment "$DB_FILE" "$item"

# Input item format:
#   [description]\t<!-- [contents] -->
#
# Output:
# Extract [contents].
# Replace `&#45;` with `-`.
# Replace `&amp;` with `&`.
decode() {
    echo -n "$1" |
        cut -d$'\t' -f2 |
        sed 's/^<!-- \(.*\) -->$/\1/' |
        sed 's/&#10;/\n/g' |
        sed 's/&#45;/-/g' |
        sed 's/&amp;/\&/g'
}

item="$(decode "$item")"
eval "$item"
