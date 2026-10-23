#!/bin/bash

# Inspect a file supplied as an argument

if [ "$#" -ne 1 ]; then
    echo "Usage: bash $0 <filename>"
    exit 1
fi

TARGET_FILE="$1"

if [ -f "$TARGET_FILE" ]; then
    echo "===== FILE INFORMATION ====="
    echo "Filename: $TARGET_FILE"
    echo "Disk usage:"
    du -h -- "$TARGET_FILE"

    echo ""
    echo "Permissions and ownership:"
    ls -l -- "$TARGET_FILE"
else
    echo "ERROR: File not found or not a regular file: $TARGET_FILE"
    exit 2
fi
