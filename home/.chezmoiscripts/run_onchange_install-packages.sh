#!/bin/bash

echo "💬 Installing brew packages"

formulae=(
    mise
    shellcheck
    starship
    yt-dlp
)

casks=(
)

for formula in "${formulae[@]}"; do
    if brew ls -1 --formula "$formula" > /dev/null 2>&1; then
        continue
    fi

    echo "💬 Installing $formula"
    brew install --quiet --formula "$formula"
done

for cask in "${casks[@]}"; do
    if brew ls -1 --cask "$cask" > /dev/null; then
        continue
    fi

    echo "💬 Installing $cask"
    brew install --quiet --cask "$cask"
done

echo "💬 Listing installed packages"
brew list --installed-on-request

echo "✅ Packages installed"
