#!/bin/bash
echo dotfiles: "$0"

set -o errexit

export HOMEBREW_NO_ENV_HINTS=true
export HOMEBREW_NO_ANALYTICS=true
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical

brew update --quiet
brew upgrade --quiet
sudo apt-get -qq update
sudo apt-get -qq upgrade

# Install VLC (Debian; for Mac, use brew cask)
if ! command -v vlc &> /dev/null
then
    echo dotfiles: Installing VLC Player
    sudo apt-get -q -y install --no-install-recommends vlc
    vlc --version
else
    echo dotfiles: VLC is already installed
fi

# Install VS Code (Debian; for Mac, use brew cask)
if ! command -v code &> /dev/null
then
    echo dotfiles: Installing VS Code
    sudo apt-get -q -y install --no-install-recommends wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends apt-transport-https code
    code --version
else
    echo dotfiles: VS Code is already installed
fi

# Install FiraCode font variant (Pop_OS!)
font_source='https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf'
font_filename="Fira Code Regular Nerd Font Complete.ttf"
font_directory="$HOME/.local/share/fonts/"
font_target="$font_directory/$font_filename"
if ! [[ -f $font_target ]]
then
    echo 'dotfiles: Installing Fira Code from Nerd Fonts'
    mkdir -p "$font_directory"
    curl --fail --silent --show-error --location $font_source > "$font_target"
    echo "⚠️ You may need to configure VS Code's font family to use Fira Code:"
    fc-list | grep "$font_target"
else
    echo dotfiles: Fira Code is already installed
fi

# Install Starship (Debian, but could also work on Mac - not sure if `/dev/null` exists)
if ! command -v starship &> /dev/null
then
    echo dotfiles: Installing Starship
    brew install --quiet starship
    eval "$(starship init bash)"
    eval "$(starship completions bash)"
    starship --version
else
    echo dotfiles: Starship is already installed
fi

# Install Docker (Ubuntu)
if ! command -v docker &> /dev/null
then
    echo dotfiles: Installing Docker engine
    sudo apt-get -q -y install --no-install-recommends ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl --fail --silent --show-error --location=https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends docker-ce docker-ce-cli containerd.io docker-compose-plugin
    docker --version
    sudo groupadd docker
    sudo usermod -aG docker "$USER"
    newgrp docker
else
    echo dotfiles: Docker is already installed
fi

# Install Brave for a Chromium browser experience (Debian)
#
# Note: Dragging is slow on Pop_OS!
# https://www.reddit.com/r/pop_os/comments/f3s4c4/comment/fhp70xs
if ! command -v brave-browser &> /dev/null
then
    sudo apt-get -q -y install --no-install-recommends apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null
    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends brave-browser
    brave-browser --version
else
    echo dotfiles: Brave is already installed
fi

# Install 1Password CLI (Debian)
if ! command -v op &> /dev/null
then
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
        sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
        sudo tee /etc/apt/sources.list.d/1password.list > /dev/null

    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
        sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol > /dev/null

    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
        sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends 1password-cli
    op --version
else
    echo dotfiles: 1password CLI is already installed
fi

# Install nushell (brew)
if ! command -v nu &> /dev/null
then
    echo dotfiles: Installing Nushell
    brew install --quiet nushell
    nu --version
else
    echo dotfiles: Nushell is already installed
fi

# Install byobu (Debian)
if ! command -v byobu &> /dev/null
then
    echo dotfiles: Installing Byobu
    sudo apt-get -q -y install --no-install-recommends byobu
    byobu --version
else
    echo dotfiles: Byobu is already installed
fi

# Install stable diffusion deps (Debian)
# https://www.assemblyai.com/blog/how-to-run-stable-diffusion-locally-to-generate-images/
#
# After install, to run models:
#
# git clone https://github.com/CompVis/stable-diffusion.git
# cd stable-diffusion/
# conda env create -f environment.yaml
# conda activate ldm
# curl https://www.googleapis.com/storage/v1/b/aai-blog-files/o/sd-v1-4.ckpt?alt=media > sd-v1-4.ckpt
# python scripts/txt2img.py --prompt "cowboy riding a unicorn over a rainbow" --plms --ckpt sd-v1-4.ckpt --skip_grid --n_samples 1
if ! command -v python3 &> /dev/null
then
    echo dotfiles: Installing Python
    sudo apt-get -q -y install --no-install-recommends python3
    python3 --version
else
    echo dotfiles: Python is already installed
fi
if ! command -v conda &> /dev/null
then
    echo dotfiles: Installing conda

    curl -sS https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | \
        sudo gpg --dearmor --output /usr/share/keyrings/conda-archive-keyring.gpg
    gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806

    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" | \
        sudo tee /etc/apt/sources.list.d/conda.list > /dev/null

    sudo apt-get -qq update
    sudo apt-get -q -y install --no-install-recommends conda

    source /opt/conda/etc/profile.d/conda.sh

    conda init bash
    
    # todo: needs testing
    conda update --yes --verbose --name base --channel defaults conda

    conda --version
else
    echo dotfiles: Conda is already installed
fi
