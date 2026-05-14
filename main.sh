#!/bin/sh

while true
do
    echo "[$(date)] Calling $URL"

    curl -L "$URL"

    echo ""
    echo "Sleeping 5 minutes..."

    sleep 300
done