#!/bin/bash

formulae=(
    bat
    difftastic
    fd
    fzf
    irssi
    nushell
    starship
    zoxide
)

for formula in "${formulae[@]}"; do
    if brew ls -1 --formula "$formula" >/dev/null 2>&1; then
        continue
    fi

    echo "💬 Installing $formula"
    brew install --quiet --formula "$formula"
done