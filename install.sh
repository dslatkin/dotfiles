#!/bin/bash
echo "dotfiles: $0"
set -euo pipefail

# Install brew (Linux)
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install chezmoi (Linux brew)
if ! command -v chezmoi &> /dev/null
then
    brew install chezmoi
fi

# Init
echo 'if [ -f ~/.dotfiles/bashrc.sh ]; then
	source ~/.dotfiles/bashrc.sh
fi' >> ~/.bashrc
chezmoi init dslatkin/dotfiles --apply
echo "dotfiles: Run \"exec bash\" to get your shell changes"
