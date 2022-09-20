#!/bin/bash
echo "dotfiles: $0"
set -euo pipefail

# Install brew (Mac and Linux)
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install chezmoi (Linux brew)
if ! command -v chezmoi &> /dev/null
then
    brew install chezmoi
fi

# Init bash
echo 'if [ -f ~/.dotfiles/bashrc.sh ]; then
	source ~/.dotfiles/bashrc.sh
fi' >> ~/.bashrc

# Init zsh
echo 'if [ -f ~/.dotfiles/zshrc.sh ]; then
	source ~/.dotfiles/zshrc.sh
fi' >> ~/.zshrc

# Init chezmoi
chezmoi init dslatkin/dotfiles --apply
echo "dotfiles: Run \"exec bash\" or \"exec zsh\" to get your shell changes"
