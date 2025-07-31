#!/bin/bash

set -euo pipefail

is_mac=false
# is_linux=false
if [[ "$OSTYPE" == "darwin"* ]]; then
    is_mac=true
fi
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if ! [ -f /etc/debian_version ]; then
        echo "❌ Only Debian is supported at this time"
        exit 1
    fi
    # is_linux=true
fi
if ! $is_mac; then
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi
if ! command -v curl; then
    # Required for brew
    echo "❌ Missing curl"
    exit 1
fi

if $is_mac; then
    if ! command -v brew > /dev/null; then
        /bin/bash -c "$(curl \
            --fail \
            --silent \
            --show-error \
            --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
        )"
        echo "💬 Brew installed"
    fi

    if ! command -v chezmoi > /dev/null; then
        brew install --formula chezmoi
        echo "💬 Chezmoi installed"
    fi
fi

# Init chezmoi
chezmoi init dslatkin/dotfiles --apply
echo "💬 Run \"exec bash\" or \"exec zsh\" to get your shell changes"
