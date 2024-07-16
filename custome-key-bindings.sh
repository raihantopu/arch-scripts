#!/bin/bash

# Define keybindings
TERMINAL_KEYBIND="<Super>Enter"
POWEROFF_KEYBIND="<Ctrl><Super><Alt>End"
RESTART_KEYBIND="<Ctrl><Super><Alt>Page_Down"
CLOSE_APP_KEYBIND="<Super><Shift>C"

# Define the commands
TERMINAL_COMMAND="gnome-terminal"
POWEROFF_COMMAND="gnome-session-quit --power-off"
RESTART_COMMAND="gnome-session-quit --reboot"
CLOSE_APP_COMMAND="xdotool getwindowfocus windowkill"

# Create custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/']"

# Set keybinding for terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 name "open-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 command "$TERMINAL_COMMAND"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0 binding "$TERMINAL_KEYBIND"

# Set keybinding for poweroff
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 name "poweroff"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 command "$POWEROFF_COMMAND"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom1 binding "$POWEROFF_KEYBIND"

# Set keybinding for restart
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom2 name "restart"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom2 command "$RESTART_COMMAND"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom2 binding "$RESTART_KEYBIND"

# Set keybinding for close application
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom3 name "close-app"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom3 command "$CLOSE_APP_COMMAND"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom3 binding "$CLOSE_APP_KEYBIND"

echo "Custom keybindings have been set."
