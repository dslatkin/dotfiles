#!/bin/bash

echo "🚀 Installing dslatkin/dotfiles from $0"

# Install fish https://fishshell.com/ for Debian
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt update
sudo apt install fish -y

# Change default shell to fish
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

# remove script
rm "$0"
