#!/bin/bash

# Basic Linux system report

REPORT_TIME=$(date '+%Y-%m-%d %H:%M:%S %Z')
SYSTEM_HOST=$(hostname)
echo "Hostname: $SYSTEM_HOST"

echo "===== SYSTEM REPORT ====="

echo ""
echo "Report generated: $REPORT_TIME"
echo "Hostname: $SYSTEM_HOST"

echo ""
echo "System uptime:"
uptime

echo ""
echo "Memory usage:"
free -h

echo ""
echo "Root filesystem usage:"
df -h /

echo ""
echo "===== REPORT COMPLETE ====="h
