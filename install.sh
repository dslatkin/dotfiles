#!/bin/bash

info() {
  echo "🚀 Dotfiles: $*"
}

info Starting install "$0"

info Install fish
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt-get update
sudo apt-get install fish -y
fish -v

info Install starship binary
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes --verbose

info Add starship to bash
starship init bash >> ~/.bashrc

info Change default shell to fish
sudo chsh -s /usr/bin/fish "$USER"

info Add starship to fish
fish -c 'echo Creating fish config file'
starship init fish >> ~/.config/fish/config.fish

info Finished install
