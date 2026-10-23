#!/bin/bash

# Check multiple files automatically

for file in system_report.sh disk_alert.sh
do
    if [ -f "$file" ]; then
        echo "FOUND: $file"
    else
        echo "MISSING: $file"
    fi
done
