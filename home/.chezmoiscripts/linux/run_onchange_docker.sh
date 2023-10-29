#!/bin/bash

set -euo pipefail

echo "⚠️ Linux scripts need work"
exit 0

# if command -v docker > /dev/null; then
#     exit
# fi

# echo "💬 Installing Docker"

# sudo apt-get -q -y install --no-install-recommends ca-certificates curl gnupg lsb-release
# sudo mkdir -p /etc/apt/keyrings
# curl --fail --silent --show-error --location https://download.docker.com/linux/ubuntu/gpg \
#     | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
#     | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get -qq update
# sudo apt-get -q -y install --no-install-recommends docker-ce docker-ce-cli containerd.io docker-compose-plugin
# docker --version
# sudo groupadd docker
# sudo usermod -aG docker "$USER"
# newgrp docker

# docker version
