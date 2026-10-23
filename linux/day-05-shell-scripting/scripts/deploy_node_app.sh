#!/bin/bash

set -Eeuo pipefail

# 1. Define paths and artifact URL
ARTIFACT_URL="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"

BASE_DIR="$HOME/node-envvars-lab"
ARCHIVE="$BASE_DIR/bootcamp-node-envvars-project-1.0.0.tgz"
EXTRACT_DIR="$BASE_DIR/extracted"
LOG_FILE="$BASE_DIR/app.log"
PID_FILE="$BASE_DIR/app.pid"

echo "===== NODE.JS APPLICATION DEPLOYMENT ====="

# 2. Check available disk space
FREE_MB=$(df -Pm / | awk 'NR==2 {print $4}')

if (( FREE_MB < 1000 )); then
    echo "ERROR: Less than 1000 MB is available on the root filesystem."
    echo "Free disk space before installing Node.js and npm dependencies."
    exit 1
fi

# 3. Avoid starting a duplicate application
if [[ -f "$PID_FILE" ]]; then
    OLD_PID=$(cat "$PID_FILE")

    if [[ "$OLD_PID" =~ ^[0-9]+$ ]] &&
       ps -p "$OLD_PID" -o args= | grep -q '[n]ode server.js'; then
        echo "Application appears to be running with PID $OLD_PID."
        echo "Stopping here to avoid starting a duplicate."
        exit 0
    fi

    rm -f "$PID_FILE"
fi

mkdir -p "$BASE_DIR" "$EXTRACT_DIR"

# 4. Install Node.js, npm, and curl
echo ""
echo "Installing Node.js, npm, and curl..."

sudo apt-get update
sudo apt-get install -y nodejs npm curl ca-certificates

# 5. Print the installed versions
echo ""
echo "Node.js version:"
node --version

echo "NPM version:"
npm --version

# 6. Download the application artifact
echo ""
echo "Downloading the application artifact..."

curl --fail --location --retry 3 \
    --output "$ARCHIVE" \
    "$ARTIFACT_URL"

# 7. Extract the downloaded .tgz archive
echo ""
echo "Extracting the application..."

tar -xzf "$ARCHIVE" -C "$EXTRACT_DIR"

# 8. Locate server.js and its application directory
SERVER_FILE=$(find "$EXTRACT_DIR" \
    -type f \
    -name server.js \
    -not -path '*/node_modules/*' \
    -print -quit)

if [[ -z "$SERVER_FILE" ]]; then
    echo "ERROR: server.js was not found after extraction."
    exit 1
fi

APP_DIR=$(dirname "$SERVER_FILE")

if [[ ! -f "$APP_DIR/package.json" ]]; then
    echo "ERROR: package.json was not found in $APP_DIR"
    exit 1
fi

# 9. Configure environment variables for child processes
export APP_ENV="dev"
export DB_USER="myuser"
export DB_PWD="mysecret"

echo ""
echo "Environment variables configured:"
echo "APP_ENV=$APP_ENV"
echo "DB_USER=$DB_USER"
echo "DB_PWD is set (value hidden)"

# 10. Install application dependencies
echo ""
echo "Installing application dependencies..."

cd "$APP_DIR"
npm install

# 11. Start the Node.js application in the background
echo ""
echo "Starting the application in the background..."

nohup node server.js >> "$LOG_FILE" 2>&1 < /dev/null &
APP_PID=$!

echo "$APP_PID" > "$PID_FILE"

# 12. Check whether the process is still running
sleep 3

if kill -0 "$APP_PID" 2>/dev/null; then
    echo "Application process is running."
    echo "PID: $APP_PID"
    echo "Application directory: $APP_DIR"
    echo "Log file: $LOG_FILE"
else
    echo "ERROR: The application did not stay running."
    echo "Recent application output:"
    tail -n 40 "$LOG_FILE" || true
    rm -f "$PID_FILE"
    exit 1
fi

echo ""
echo "===== DEPLOYMENT SCRIPT COMPLETE ====="
