#!/bin/bash

set -euo pipefail

brew_installer_env=()
if [[ "${REMOTE_CONTAINERS:-}" == "true" || "${CODESPACES:-}" == "true" ]]; then
    brew_installer_env+=(NONINTERACTIVE=1)
fi

chezmoi_extra_options=()
if [[ "${CODESPACES:-}" == "true" ]]; then
    codespaces_dotfiles_dir=/workspaces/.codespaces/.persistedshare/dotfiles
    chezmoi_extra_options+=(--source "$codespaces_dotfiles_dir")
fi

if ! command -v brew > /dev/null; then
    echo "💬 Installing brew"
    brew_installer=$(curl \
        --fail \
        --silent \
        --show-error \
        --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    )
    env "${brew_installer_env[@]}" /bin/bash -c "$brew_installer"

    # This dir is standard via Brew install script
    brew_dir=/home/linuxbrew/.linuxbrew
    eval "$($brew_dir/bin/brew shellenv bash)"
fi

if ! command -v chezmoi > /dev/null; then
    echo "💬 Installing chezmoi"
    brew install chezmoi
fi

# echo "💬 Initializing chezmoi and applying to home directory"
# chezmoi init dslatkin/dotfiles --apply "${chezmoi_extra_options[@]}"

# # echo "💬 Configuring .bashrc"
# # cat <<EOF >> "$HOME/.bashrc"
# # # Added from dotfiles install script
# # source "\$HOME/.dotfiles/bashrc.sh"
# # EOF

# # echo "✅ Dotfiles installed, run \"exec bash\" to get shell changes"
