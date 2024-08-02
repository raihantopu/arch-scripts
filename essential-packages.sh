#!/bin/bash

# Update package list and upgrade installed packages
sudo pacman -Syu

# Essential packages
PACKAGES=(
    networkmanager
    wpa_supplicant
    iwd
    bluez
    bluez-utils
    blueman
    nano
    gedit
    dbeaver
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

systemctl enable NetworkManager
systemctl enable bluetooth.service


echo "Essential packages installed successfully."
