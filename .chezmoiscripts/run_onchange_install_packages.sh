#!/bin/bash
echo dotfiles: "$0"

# Exit on error
set -o errexit

# Prep package installations
export HOMEBREW_NO_ENV_HINTS=true
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
sudo apt-get update

# Install VS Code (Debian; for Mac, use brew flask)
if ! command -v code &> /dev/null
then
    echo dotfiles: Installing VS Code
    sudo apt-get -y install --no-install-recommends wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt-get update
    sudo apt-get -y install --no-install-recommends apt-transport-https code
else
    echo dotfiles: VS Code is already installed
fi

# Install FiraCode font variant (Pop_OS!)
FONT_SOURCE='https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf'
FONT_TARGET="$HOME/.local/share/fonts/Fira Code Regular Nerd Font Complete.ttf"
if ! [[ -f $FONT_TARGET ]]
then
    echo 'dotfiles: Installing Fira Code from Nerd Fonts'
    curl --fail --silent --show-error --location $FONT_SOURCE > "$FONT_TARGET"
else
    echo dotfiles: Fira Code is already installed
fi

# Install Starship (Debian)
if ! command -v starship &> /dev/null
then
    echo dotfiles: Installing Starship
    brew install --quiet starship
    bash -c "(starship init bash && starship completions bash) >> ~/.bashrc"
else
    echo dotfiles: Starship is already installed
fi

# Install Docker (Ubuntu)
if ! command -v docker &> /dev/null
then
    echo dotfiles: Installing Docker engine
    sudo apt-get -y install --no-install-recommends ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl --fail --silent --show-error --location=https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install --no-install-recommends docker-ce docker-ce-cli containerd.io docker-compose-plugin
    echo dotfiles: Configuring Docker permissions
    sudo groupadd docker
    sudo usermod -aG docker "$USER"
    newgrp docker
else
    echo dotfiles: Docker is already installed
fi