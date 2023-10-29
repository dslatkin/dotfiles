#!/bin/bash

set -euo pipefail

echo "⚠️ Linux scripts need work"
exit 0

# echo "💬 Installing Brave"
# sudo apt-get -q -y install --no-install-recommends apt-transport-https curl
# curl --fail --silent --show-error --location https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg \
#     | sudo tee /usr/share/keyrings/brave-browser-archive-keyring.gpg > /dev/null
# echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null
# sudo apt-get -qq update
# sudo apt-get -q -y install --no-install-recommends brave-browser
# brave-browser --version