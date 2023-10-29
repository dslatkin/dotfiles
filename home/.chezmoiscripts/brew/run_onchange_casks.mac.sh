#!/bin/bash

echo "Running casks"

casks=(
    1password
    1password-cli
    brave-browser
    signal
    visual-studio-code
    vlc
)

for cask in "${casks[@]}"; do
    if brew ls -1 --cask "$cask" > /dev/null; then
        continue
    fi

    echo "💬 Installing $cask"
    brew install --quiet --cask "$cask"
done