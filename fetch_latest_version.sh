#!/bin/sh
set -e

URL=$(cat ./download.txt)

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