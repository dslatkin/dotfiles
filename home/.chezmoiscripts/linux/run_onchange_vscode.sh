#!/bin/bash

set -euo pipefail

echo "⚠️ Linux scripts need work"
exit 0

# if ! command -v code > /dev/null; then
#     echo "💬 Installing VS Code"
#     sudo apt-get -q -y install --no-install-recommends wget gpg
#     wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#     sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
#     sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
#     rm -f packages.microsoft.gpg
#     sudo apt-get -qq update
#     sudo apt-get -q -y install --no-install-recommends apt-transport-https code
#     code --version
# else
#     echo "💬 VS Code is already installed"
# fi
