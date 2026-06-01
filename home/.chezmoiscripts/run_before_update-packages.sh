#!/bin/bash

set -euo pipefail

# https://docs.brew.sh/rubydoc/Homebrew/EnvConfig.html
# Brew docs on HOMEBREW_NO_ANALYTICS recommend env vars like this to `1`
# export HOMEBREW_NO_ENV_HINTS=1
# export HOMEBREW_NO_ANALYTICS=1

echo "💬 Updating packages"
brew update --quiet

echo "💬 Upgrading packages"
brew upgrade --quiet

echo "✅ Package updated"

