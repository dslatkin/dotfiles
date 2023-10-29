#!/bin/bash

set -euo pipefail

original_files=(
    .bashrc
)

# Backup chezmoi-managed files if they already exist
for file in "${original_files[@]}"; do
    old_file=$HOME/$file
    if [ -f "$old_file" ]; then
        echo "💬 Backing up original $old_file to $old_file.bkp"
        mv "$old_file" "$old_file.bkp"
    else
        touch "$old_file.bkp"
    fi
done
