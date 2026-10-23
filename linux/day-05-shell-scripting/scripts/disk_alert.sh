#!/bin/bash

# Monitor root filesystem usage

DISK_USAGE=$(df -P / | awk 'NR==2 {gsub("%", "", $5); print $5}')

echo "===== DISK USAGE CHECK ====="
echo "Root filesystem usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -ge 80 ]; then
    echo "WARNING: Root filesystem usage is at least 80%."
else
    echo "OK: Root filesystem usage is below 80%."
fi

echo "===== CHECK COMPLETE ====="
