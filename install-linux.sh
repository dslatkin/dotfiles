#!/bin/bash

set -euo pipefail

if ! command -v brew >/dev/null; then
    echo "💬 Installing brew"
    /bin/bash -c "$(curl \
        --fail \
        --silent \
        --show-error \
        --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    )"
fi

if ! command -v chezmoi >/dev/null; then
    echo "💬 Installing chezmoi"
    brew install chezmoi
fi

echo "💬 Initializing chezmoi"
chezmoi init dslatkin/dotfiles --apply

echo "💬 Configuring .bashrc"
cat <<EOF >> "$HOME/.bashrc"
# Added from dotfiles install script
source "\$HOME/.dotfiles/bashrc"
EOF

echo "✅ Dotfiles installed, run \"exec bash\" to get shell changes"
