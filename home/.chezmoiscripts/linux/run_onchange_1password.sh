#!/bin/bash

set -euo pipefail

echo "⚠️ Linux scripts need work"
exit 0

# if command -v 1password > /dev/null && command -v op > /dev/null; then
#     return
# fi
    
# curl --fail --silent --show-error --location https://downloads.1password.com/linux/keys/1password.asc \
#     | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
#     sudo tee /etc/apt/sources.list.d/1password.list > /dev/null

# sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
# curl --fail --silent --show-error --location https://downloads.1password.com/linux/debian/debsig/1password.pol \
#     | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol > /dev/null

# sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
# curl --fail --silent --show-error --location https://downloads.1password.com/linux/keys/1password.asc \
#     | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

# sudo apt-get -qq update
# sudo apt-get -q -y install --no-install-recommends 1password 1password-cli

# op --version

# echo "💬 1Password desktop app and CLI already installed"
