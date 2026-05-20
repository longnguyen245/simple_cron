#!/bin/sh
set -e

if [ -n "$CUSTOM_DOWNLOAD_URL" ]; then
  URL="$CUSTOM_DOWNLOAD_URL"
else
  URL=$(cat ./download.txt)
fi

if [ -z "$URL" ]; then
  echo "download.txt is empty"
  exit 1
fi

echo "Downloading: $URL"

curl -L "$URL" -o download.tar.gz
tar -xzf download.tar.gz

chmod +x telecloud
chmod +x main.sh

# install packages
pip install yt-dlp

export PATH="$(dirname "$(which yt-dlp)"):$PATH"