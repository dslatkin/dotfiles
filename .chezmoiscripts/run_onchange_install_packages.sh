#!/bin/bash
echo dotfiles: "$0"

# Prep package installations
export HOMEBREW_NO_ENV_HINTS=true
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
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

# Install Docker
if ! command -v docker &> /dev/null
then
    echo dotfiles: Installing Docker engine
    sudo apt-get -y install --no-install-recommends ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # todo: Getting an error on next command
    #
    # Hit:9 http://us.archive.ubuntu.com/ubuntu jammy-backports InRelease            
    # Hit:10 https://ppa.launchpadcontent.net/kisak/kisak-mesa/ubuntu jammy InRelease
    # Reading package lists... Done
    # E: The repository 'https://download.docker.com/linux/debian jammy Release' does not have a Release file.
    # N: Updating from such a repository can't be done securely, and is therefore disabled by default.
    # N: See apt-secure(8) manpage for repository creation and user configuration details.
    #
    # Likely due to lsb_release giving the Ubuntu codename which doesn't work
    # with the install script that Docker suggests for Debian, see:
    # 
    # - https://download.docker.com/linux/debian
    # - https://download.docker.com/linux/ubuntu/dists/
    #
    # From `cat /etc/debian_version` it like Pop_OS! (based on Ubuntu 22) uses
    # `bookworm/sid` which isn't supported by Docker yet. Options:
    #
    # - Move my OS to the last release supported (LTS v22->20, not ideal)
    # - Convert my script to an Ubuntu install (probably best)
    # - Use the canned install script at https://get.docker.com/ (tested, has same issue w/ unsupported Debian)
    # - Try Docker desktop instead https://docs.docker.com/desktop/linux/install/debian/

    sudo apt-get update
    sudo apt-get install --no-install-recommends docker-ce docker-ce-cli containerd.io docker-compose-plugin
else
    echo dotfiles: Docker is already installed
fi
