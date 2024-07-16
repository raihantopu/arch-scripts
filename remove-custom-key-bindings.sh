#!/bin/bash

# Reset the custom keybindings to an empty array
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[]"

echo "All custom keybindings have been removed."
