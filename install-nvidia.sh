#!/bin/bash

# Function to print messages
print_message() {
    echo "======================================="
    echo "$1"
    echo "======================================="
}

# Update package list and upgrade all packages
print_message "Updating package list and upgrading all packages"
sudo pacman -Syu --noconfirm

# Install necessary packages
print_message "Installing necessary packages"
sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings xorg-xrandr

# Create Xorg configuration file for NVIDIA
print_message "Creating Xorg configuration file for NVIDIA"
sudo mkdir -p /etc/X11/xorg.conf.d
sudo tee /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf <<EOF
Section "OutputClass"
    Identifier "intel"
    MatchDriver "i915"
    Driver "modesetting"
EndSection

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    Option "PrimaryGPU" "yes"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
EOF

# Create .xinitrc if it doesn't exist and add xrandr commands
print_message "Modifying .xinitrc"
if [ ! -f ~/.xinitrc ]; then
    touch ~/.xinitrc
fi
echo 'xrandr --setprovideroutputsource modesetting NVIDIA-0' >> ~/.xinitrc
echo 'xrandr --auto' >> ~/.xinitrc

# Configure GDM to use NVIDIA GPU
print_message "Configuring GDM"
sudo tee /usr/share/gdm/greeter/autostart/optimus.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Optimus
Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
NoDisplay=true
X-GNOME-Autostart-Phase=DisplayServer
EOF

sudo tee /etc/xdg/autostart/optimus.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Optimus
Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
NoDisplay=true
X-GNOME-Autostart-Phase=DisplayServer
EOF

# Ensure GDM uses X as the default backend
sudo sed -i 's|#WaylandEnable=false|WaylandEnable=false|' /etc/gdm/custom.conf

# Reboot to apply changes
print_message "Rebooting to apply changes"