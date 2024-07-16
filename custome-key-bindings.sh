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
CLOSE_APP_COMMAND="xdotool getwindowfocus windowclose"

# Array of custom keybinding paths
KEYBINDING_PATHS=("/org/gnome/settings-daemon.plugins.media-keys.custom-keybindings/custom0/"
                  "/org/gnome/settings-daemon.plugins.media-keys.custom-keybindings/custom1/"
                  "/org/gnome/settings-daemon.plugins.media-keys.custom-keybindings/custom2/"
                  "/org/gnome/settings-daemon.plugins.media-keys.custom-keybindings/custom3/")

# Apply custom keybinding paths
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['${KEYBINDING_PATHS[0]}', '${KEYBINDING_PATHS[1]}', '${KEYBINDING_PATHS[2]}', '${KEYBINDING_PATHS[3]}']"

# Set keybinding for terminal
gsettings set "${KEYBINDING_PATHS[0]}" name "open-terminal"
gsettings set "${KEYBINDING_PATHS[0]}" command "$TERMINAL_COMMAND"
gsettings set "${KEYBINDING_PATHS[0]}" binding "$TERMINAL_KEYBIND"

# Set keybinding for poweroff
gsettings set "${KEYBINDING_PATHS[1]}" name "poweroff"
gsettings set "${KEYBINDING_PATHS[1]}" command "$POWEROFF_COMMAND"
gsettings set "${KEYBINDING_PATHS[1]}" binding "$POWEROFF_KEYBIND"

# Set keybinding for restart
gsettings set "${KEYBINDING_PATHS[2]}" name "restart"
gsettings set "${KEYBINDING_PATHS[2]}" command "$RESTART_COMMAND"
gsettings set "${KEYBINDING_PATHS[2]}" binding "$RESTART_KEYBIND"

# Set keybinding for close application
gsettings set "${KEYBINDING_PATHS[3]}" name "close-app"
gsettings set "${KEYBINDING_PATHS[3]}" command "$CLOSE_APP_COMMAND"
gsettings set "${KEYBINDING_PATHS[3]}" binding "$CLOSE_APP_KEYBIND"

echo "Custom keybindings have been set."

