#!/bin/sh

while true
do
    echo "[$(date)] Calling $URL"

    curl -fsL "$URL" > /dev/null 2>&1

    echo ""
    echo "Run after 5 minutes"

    sleep 300
done

./telecloud