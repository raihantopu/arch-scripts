#!/bin/bash

# Update package list and upgrade installed packages
sudo pacman -Syu

# Essential packages
PACKAGES=(
    # Network management
    networkmanager
    wpa_supplicant
    iwd
    bluez
    bluez-utils
    blueman
    
    # Browsers
    firefox
    brave-bin
    
    # Java Development Kit
    jdk21-openjdk
    jdk8-openjdk
    
    # Media Player
    vlc
    
    # Torrent Client
    transmission-gtk
    
    # Backups
    deja-dup
    
    # Utilities
    neofetch
    curl
    wget
    gnome-tweaks
    gedit
    ntfs-3g
)

# Install packages
for PACKAGE in "${PACKAGES[@]}"; do
    sudo pacman -S --noconfirm $PACKAGE
done

echo "Essential packages installed successfully."
