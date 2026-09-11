#!/bin/bash

set -euo pipefail

global_git_emails=$(git config --global --get-all user.email || true)
if [[ -z "$global_git_emails" ]]; then
    echo "✅ No global git email set"
    exit 0
fi

echo "💬 Unsetting global git email: ${global_git_emails//$'\n'/, }"
git config --global --unset-all user.email

echo "✅ Global git email unset"
