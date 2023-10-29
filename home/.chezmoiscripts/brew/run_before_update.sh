#!/bin/bash

set -euo pipefail

echo "💬 Updating Homebrew packages"
export HOMEBREW_NO_ENV_HINTS=true
export HOMEBREW_NO_ANALYTICS=true
brew update --quiet
brew upgrade --quiet
