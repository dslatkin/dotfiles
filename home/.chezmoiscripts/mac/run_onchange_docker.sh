#!/bin/bash

set -euo pipefail

if command -v docker > /dev/null; then
    exit
fi

echo "💬 Installing Docker"

if [ "$(uname -m)" = x86_64 ]; then
    architecture=amd64
elif [ "$(uname -m)" = arm64 ]; then
    architecture=arm64
else
    echo "🛑 Unrecognized architecture"
    exit 1
fi

curl --fail --progress-bar \
    --location https://desktop.docker.com/mac/main/$architecture/Docker.dmg \
    --output ~/Downloads/Docker.dmg
sudo hdiutil attach ~/Downloads/Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --accept-license
sudo hdiutil detach /Volumes/Docker

# todo: Verify if a restart is needed or not before starting it
open /Applications/Docker.app

docker version
