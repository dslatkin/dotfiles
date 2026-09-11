#!/bin/bash

set -euo pipefail

if ! command -v brew > /dev/null; then
    echo "💬 Installing brew"
    brew_env=()
    if [[ "${REMOTE_CONTAINERS:-}" == "true" || "${CODESPACES:-}" == "true" ]]; then
        brew_env+=(NONINTERACTIVE=1)
    fi
    env "${brew_env[@]}" /bin/bash -c "$(curl \
        --fail \
        --silent \
        --show-error \
        --location https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    )"

    # This dir is standard via Brew install script
    brew_dir=/home/linuxbrew/.linuxbrew
    eval "$($brew_dir/bin/brew shellenv bash)"
fi

if ! command -v chezmoi > /dev/null; then
    echo "💬 Installing chezmoi"
    brew install chezmoi
fi

echo "💬 Initializing chezmoi"
if [[ "${CODESPACES:-}" == "true" ]]; then
    # Source dir location cannot change and is documented here
    # https://docs.github.com/en/codespaces/troubleshooting/troubleshooting-personalization-for-codespaces#troubleshooting-dotfiles
    codespaces_dotfiles_dir=/workspaces/.codespaces/.persistedshare/dotfiles
    chezmoi_extra_options+=(--source "$codespaces_dotfiles_dir")
fi

echo "💬 Todo - init and apply chezmoi"
# chezmoi init dslatkin/dotfiles --apply "${chezmoi_extra_options[@]}"
# chezmoi init dslatkin/dotfiles --apply

# # echo "💬 Configuring .bashrc"
# # cat <<EOF >> "$HOME/.bashrc"
# # # Added from dotfiles install script
# # source "\$HOME/.dotfiles/bashrc.sh"
# # EOF

# # echo "✅ Dotfiles installed, run \"exec bash\" to get shell changes"
