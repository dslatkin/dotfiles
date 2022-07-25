#!/bin/bash

# IMPORTANT NOTE
#
# All config executed in this file should be idempotent since this file re-runs
# on `chezmoi apply` any time the hash of its contents has changed.

# Add maximize button
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
