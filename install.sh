#!/bin/bash

echo "🚀 Installing dslatkin/dotfiles from $0"

# Install fish
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt-get update
sudo apt-get install fish -y

# Install starship binary binary
bash -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes --verbose

# Add starship to bash
echo "eval \"$(starship init bash)\"" >> ~/.bashrc

# Change default shell to fish
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

# Add starship to fish
starship init fish >> ~/.config/fish/config.fish

# Remove script
rm "$0"
