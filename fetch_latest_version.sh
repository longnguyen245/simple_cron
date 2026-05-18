#!/bin/sh

URL=$(
curl -s https://api.github.com/repos/dabeecao/telecloud-go/releases/latest \
| grep browser_download_url \
| grep linux_amd64 \
| sed -E 's/.*"([^"]+)".*/\1/' \
| head -n1
)

if [ -z "$URL" ]; then
  echo "binary linux_amd64 not found"
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