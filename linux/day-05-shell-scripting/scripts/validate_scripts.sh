#!/bin/bash

# Check Bash syntax in every shell script

echo "===== SCRIPT VALIDATION ====="

for file in *.sh
do
    if [ -f "$file" ]; then
        echo ""
        echo "Checking: $file"

        if bash -n "$file"; then
            echo "PASS: $file"
        else
            echo "FAIL: $file"
        fi
    fi
done

echo ""
echo "===== VALIDATION COMPLETE ====="
