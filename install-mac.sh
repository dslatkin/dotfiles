#!/bin/bash

set -euo pipefail

if ! command -v brew > /dev/null; then
    echo "❌ Missing brew, use the .pkg installer to install it"
    exit 1
fi

if ! command -v chezmoi > /dev/null; then
    echo "💬 Installing chezmoi"
    brew install chezmoi
fi

echo "💬 Initializing chezmoi"
chezmoi init dslatkin/dotfiles --apply

echo "💬 Configuring .zshrc"
target_file="$HOME/.zshrc"
temp_file=$(mktemp)
cat <<EOF > "$temp_file"
# Added from dotfiles install script
source "\$HOME/.dotfiles/zshrc.sh"
EOF
cat "$target_file" >> "$temp_file"
mv "$temp_file" "$target_file"

echo "✅ Dotfiles installed, run \"exec zsh\" to get shell changes"
