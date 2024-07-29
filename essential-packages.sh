#!/bin/bash

# Update package list and upgrade installed packages
sudo pacman -Syu

# Essential packages
PACKAGES=(
    base
    base-devel
    networkmanager
    wpa_supplicant
    iwd
    bluez
    bluez-utils
    blueman
    nano
    gedit
    dbeaver
    openconnect
    
    firefox
    
    jdk21-openjdk
    jdk8-openjdk
    
    vlc
    
    transmission-gtk
    
    deja-dup
    
    xterm
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
