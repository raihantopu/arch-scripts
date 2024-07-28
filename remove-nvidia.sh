#!/bin/bash

# Function to print messages
print_message() {
    echo "======================================="
    echo "$1"
    echo "======================================="
}

# Remove NVIDIA packages
print_message "Removing NVIDIA packages"
sudo pacman -Rns --noconfirm nvidia nvidia-utils nvidia-settings xorg-xrandr

# Remove Xorg configuration file for NVIDIA
print_message "Removing Xorg configuration file for NVIDIA"
sudo rm -f /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf

# Remove xrandr commands from .xinitrc
print_message "Removing xrandr commands from .xinitrc"
sed -i '/xrandr --setprovideroutputsource modesetting NVIDIA-0/d' ~/.xinitrc
sed -i '/xrandr --auto/d' ~/.xinitrc

# Remove GDM configuration for NVIDIA
print_message "Removing GDM configuration for NVIDIA"
sudo rm -f /usr/share/gdm/greeter/autostart/optimus.desktop
sudo rm -f /etc/xdg/autostart/optimus.desktop

# Revert GDM custom configuration
sudo sed -i 's|WaylandEnable=false|#WaylandEnable=false|' /etc/gdm/custom.conf

# Reboot to apply changes
print_message "Rebooting to apply changes"