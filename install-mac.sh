#!/bin/bash

set -euo pipefail

export HOMEBREW_NO_ANALYTICS=1

if ! command -v brew >/dev/null; then
    echo "❌ Missing brew, use the latest .pkg release to install"
    echo "🔗 https://github.com/Homebrew/brew/releases/latest"
    exit 1
fi

if ! command -v chezmoi >/dev/null; then
    echo "💬 Installing chezmoi"
    brew install chezmoi
fi

echo "💬 Initializing chezmoi"
chezmoi init dslatkin/dotfiles --apply

echo "✅ Dotfiles installed, run \"exec zsh\" to get shell changes"
