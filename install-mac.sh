#!/bin/bash

set -euo pipefail

if ! command -v brew >/dev/null; then
    echo "❌ Missing brew, use the .pkg installer to install it"
    exit 1
fi

if ! command -v chezmoi >/dev/null; then
    echo "💬 Installing chezmoi"
    brew install chezmoi
fi

echo "💬 Initializing chezmoi"
chezmoi init dslatkin/dotfiles --apply

echo "💬 Configuring .zshrc"
cat <<EOF >> "$HOME/.zshrc"
# Added from dotfiles install script
source "\$HOME/.dotfiles/zshrc"
EOF

echo "✅ Dotfiles installed, run \"exec zsh\" to get shell changes"
