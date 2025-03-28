#!/bin/bash

# Usage:
# ./fswatch_rsync.sh username@remote_host [optional_rsync_options]
#
# Examples:
# ./fswatch_rsync.sh username@remote_host
# ./fswatch_rsync.sh username@remote_host --exclude='__pycache__/' --exclude='.venv' --delete


REMOTE_HOST="$1"
shift
ARGS=("$@")

SRC="${PWD}/"
DEST="${REMOTE_HOST}:~/${PWD#"$HOME"}/"

{
  echo "1"  # Force initial run.
  fswatch -o "$PWD/" --exclude=".git/.*"  # Watch for changes in the current directory.
} | while read -r _; do
  echo ""
  echo ">>>"
  echo "SRC: ${SRC}"
  echo "DEST: ${DEST}"
  echo "Start: $(date)"
  rsync -avz --progress --partial "$SRC" "$DEST" "${ARGS[@]}"
  echo "SRC: ${SRC}"
  echo "DEST: ${DEST}"
  echo "End: $(date)"
done
