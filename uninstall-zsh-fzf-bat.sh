#!/bin/bash

# Revert default shell to bash
chsh -s $(which bash) $(whoami)

# Remove Powerlevel10k theme
rm -rf ~/powerlevel10k

# Remove Meslo Nerd Fonts
rm -f ~/.local/share/fonts/MesloLGS\ NF*.ttf
fc-cache -fv

# Remove zsh plugins
rm -rf ~/.zsh/zsh-autosuggestions
rm -rf ~/.zsh/zsh-completions

# Clean zshrc entries if file exists
if [ -f ~/.zshrc ]; then
  sed -i '/powerlevel10k.zsh-theme/d' ~/.zshrc
  sed -i '/zsh-autosuggestions/d' ~/.zshrc
  sed -i '/zsh-completions/d' ~/.zshrc
  sed -i '/alias open=/d' ~/.zshrc
fi

# Optionally remove fzf, bat, and zsh
sudo pacman -Rns --noconfirm fzf bat zsh

# Cleanup home directory configs
rm -rf ~/.zsh ~/.fzf ~/.bat

# Optional: remove .zshrc if created solely for this setup
# rm -f ~/.zshrc

echo "✅ Zsh, fzf, bat uninstalled and configuration cleaned."
