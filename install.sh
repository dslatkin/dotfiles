#!/bin/bash
echo dotfiles: "$0"

echo dotfiles: Configuring install script
set -o errexit

# Install brew (Linux)
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # shellcheck disable=SC2016
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install chezmoi (Linux brew)
if ! command -v brew &> /dev/null
then
    brew install chezmoi
fi

# Init 
chezmoi init dslatkin/dotfiles --apply

