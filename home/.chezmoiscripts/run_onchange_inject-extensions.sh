#!/bin/bash

set -euo pipefail

readonly begin_marker="# >>> dotfiles >>>"
readonly end_marker="# <<< dotfiles <<<"

inject_extension() {
    local target=$1
    shift

    echo "💬 Injecting into $target"
    touch "$target"

    # `grep --count` exits 1 on zero matches but still prints the 0
    local begin_count end_count
    begin_count=$(grep --count --line-regexp --fixed-strings \
        "$begin_marker" "$target" || true)
    end_count=$(grep --count --line-regexp --fixed-strings \
        "$end_marker" "$target" || true)

    if ((begin_count > 1 || end_count > 1)); then
        echo "❌ Found more than one dotfiles fence in $target, fix it by hand" >&2
        exit 1
    fi
    if ((begin_count != end_count)); then
        echo "❌ Found an unpaired dotfiles fence in $target, fix it by hand" >&2
        exit 1
    fi
    if ((begin_count == 1)); then
        local begin_line end_line
        begin_line=$(grep --line-number --line-regexp --fixed-strings \
            "$begin_marker" "$target" | cut -d: -f1)
        end_line=$(grep --line-number --line-regexp --fixed-strings \
            "$end_marker" "$target" | cut -d: -f1)
        if ((begin_line > end_line)); then
            echo "❌ Found a reversed dotfiles fence in $target, fix it by hand" >&2
            exit 1
        fi
    fi

    # Blank lines on either side of the removed fence collapse into the larger
    # run, and trailing blank lines are dropped, so repeated runs don't pile up
    # whitespace
    local stripped
    stripped=$(mktemp)
    awk -v begin="$begin_marker" -v end="$end_marker" '
        $0 == begin { skipping = 1; next }
        $0 == end { skipping = 0; merging = 1; before = blanks; blanks = 0; next }
        skipping { next }
        /^$/ { blanks++; next }
        {
            if (merging) { blanks = before > blanks ? before : blanks; merging = 0 }
            for (; blanks > 0; blanks--) print ""
            print
        }
    ' "$target" >"$stripped"

    # Write through `cat` rather than `mv` so symlinks and permissions survive
    {
        cat "$stripped"
        if [[ -s "$stripped" ]]; then
            echo
        fi
        echo "$begin_marker"
        printf '%s\n' "$@"
        echo "$end_marker"
    } >"$target"
    rm "$stripped"
}

# shellcheck disable=SC2016 # These are meant to expand when sourced, not here
inject_extension "$HOME/.bashrc" 'source "$HOME/.dotfiles/bashrc.sh"'

if [[ "${DOTFILES_IS_MAC:-}" == "true" ]]; then
    # shellcheck disable=SC2016
    inject_extension "$HOME/.zshrc" 'source "$HOME/.dotfiles/zshrc.sh"'
fi

inject_extension "$HOME/.gitconfig" '[include]' 'path = ~/.dotfiles/gitconfig'

echo "✅ Extensions injected"
