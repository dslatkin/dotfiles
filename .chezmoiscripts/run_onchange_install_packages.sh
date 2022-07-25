#!/bin/bash
echo dotfiles: "$0"

echo dotfiles: Configuring install script
set -o errexit
export HOMEBREW_NO_ENV_HINTS=true
export HOMEBREW_NO_INSTALL_UPGRADE=true
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical

echo dotfiles: Updating packages
brew update --quiet
sudo apt-get -qq update

# Todo: apt install belows should be more DRY-like
#
# According to apt-get's man pages, we can set an apt config file with
# the APT_CONFIG variable for `apt-get` so we don't have to constantly  run the
# same flags like `-q`, `-y`, etc. Alternatively, we could create a bash utility
# function for installing packages by name.

# Install VS Code (Debian; for Mac, use brew cask)
if ! command -v code &> /dev/null
then
    echo dotfiles: Installing VS Code
    sudo apt-get -q -y install --no-install-recommends wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends apt-transport-https code
else
    echo dotfiles: VS Code is already installed
fi

# Install FiraCode font variant (Pop_OS!)
font_source='https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf'
font_target="$HOME/.local/share/fonts/Fira Code Regular Nerd Font Complete.ttf"
if ! [[ -f $font_target ]]
then
    echo 'dotfiles: Installing Fira Code from Nerd Fonts'
    curl --fail --silent --show-error --location $font_source > "$font_target"
    echo "⚠️ You may need to configure VS Code's font family to use Fira Code:"
    fc-list | grep "$font_target"
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
    sudo apt-get -q -y install --no-install-recommends ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl --fail --silent --show-error --location=https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends docker-ce docker-ce-cli containerd.io docker-compose-plugin
    echo dotfiles: Configuring Docker permissions
    sudo groupadd docker
    sudo usermod -aG docker "$USER"
    newgrp docker
else
    echo dotfiles: Docker is already installed
fi

# Install Brave for a Chromium browser experience (Debian)
#
# Note: Dragging is slow on Pop_OS!
# https://www.reddit.com/r/pop_os/comments/f3s4c4/comment/fhp70xs
if ! command -v brave-browser &> /dev/null
then
    sudo apt-get -q -y install --no-install-recommends apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null
    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends brave-browser
else
    echo dotfiles: Brave is already installed
fi

# Install 1Password CLI (Debian)
if ! command -v op &> /dev/null
then
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
    sudo tee /etc/apt/sources.list.d/1password.list > /dev/null
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
    sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol > /dev/null
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends 1password-cli
    op --version
else
    echo dotfiles: 1password CLI is already installed
fi
