#!/bin/bash

echo "Running casks"

formulae=(
    bat
    difftastic
    fd
    fzf
    nushell
    starship
    zoxide
)

casks=(
    1password
    1password-cli
    brave-browser
    visual-studio-code
    vlc
)

for formula in "${formulae[@]}"; do
    if brew ls -1 --formula "$formula" >/dev/null 2>&1; then
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
