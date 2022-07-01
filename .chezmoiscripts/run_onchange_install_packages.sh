#!/bin/bash
echo dotfiles: "$0"

# Prep package installations
export HOMEBREW_NO_ENV_HINTS=true
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update

# Install VS Code (for Mac, use its flask on brew instead)
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

# Install Starship
if ! command -v starship &> /dev/null
then
    echo dotfiles: Installing Starship
    brew install --quiet starship
    # bash -c "(starship init bash && starship completions bash) >> ~/.bashrc"
else
    echo dotfiles: Starship is already installed
fi
