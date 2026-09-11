#!/bin/bash

echo "💬 Installing brew packages"

readonly global_formulas=(
    mise
    shellcheck
    starship
)

readonly mac_only_formulas=(
    ffmpeg
    yt-dlp
)

readonly formulas=(
    "${global_formulas[@]}"
    "${mac_only_formulas[@]}"
)

for formula in "${formulas[@]}"; do
    if brew ls -1 --formula "$formula" >/dev/null 2>&1; then
        continue
    fi

    echo "💬 Installing $formula"
    brew install --quiet --formula "$formula"
done

echo "💬 Listing installed packages"
brew list --installed-on-request

echo "✅ Packages installed"
