#!/bin/bash

set -euo pipefail

echo "⚠️ Linux scripts need work"
exit 0

echo "💬 Updating Debian packages"
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
sudo apt-get -qq update
sudo apt-get -qq upgrade
