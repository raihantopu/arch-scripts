#!/bin/bash

# Revert default shell to bash
chsh -s $(which bash) $(whoami)

# Remove Powerlevel10k theme
rm -rf ~/powerlevel10k

# Remove Meslo Nerd Font
rm -f ~/.local/share/fonts/MesloLGS\ NF\ Regular.ttf
rm -f ~/.local/share/fonts/MesloLGS\ NF\ Bold.ttf
rm -f ~/.local/share/fonts/MesloLGS\ NF\ Italic.ttf
rm -f ~/.local/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf

fc-cache -fv

# Remove zsh plugins
rm -rf ~/.zsh/zsh-autosuggestions
rm -rf ~/.zsh/zsh-completions

# Remove configurations from .zshrc
sed -i '/powerlevel10k.zsh-theme/d' ~/.zshrc
sed -i '/zsh-autosuggestions.zsh/d' ~/.zshrc
sed -i '/zsh-completions.plugin.zsh/d' ~/.zshrc
sed -i '/alias open=/d' ~/.zshrc

#Clear all cache
rm -rf ~/.cache/p10k*

# Optionally remove fzf if it was installed only for zsh
sudo pacman -Rns --noconfirm fzf bat
rm -rf ~/.fzf
rm -rf ~/.bat

# Remove zsh
sudo pacman -Rns --noconfirm zsh
rm -rf ~/.zsh
rm -rf ~/.zshrc

# Print completion message
echo "Uninstallation and configuration cleanup completed. Please restart your terminal."
