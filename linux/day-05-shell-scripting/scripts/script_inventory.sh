#!/bin/bash

# List all shell scripts in the current directory

echo "===== SHELL SCRIPT INVENTORY ====="

for file in *.sh
do
    if [ -f "$file" ]; then
        echo ""
        echo "Script: $file"
        ls -lh -- "$file"
    fi
done

echo ""
echo "===== INVENTORY COMPLETE ====="
