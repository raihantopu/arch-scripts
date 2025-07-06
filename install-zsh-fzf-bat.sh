#!/bin/bash

# Update package list and install necessary packages
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm zsh fzf bat xclip git curl

# Change default shell to zsh
chsh -s $(which zsh) $(whoami)

# Install Powerlevel10k theme
if [ ! -d ~/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi

# Ensure .zshrc exists
touch ~/.zshrc

# Add Powerlevel10k theme to .zshrc if not already present
grep -qxF 'source ~/powerlevel10k/powerlevel10k.zsh-theme' ~/.zshrc || echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Install Meslo Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

fonts=(
  "MesloLGS NF Regular.ttf|https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
  "MesloLGS NF Bold.ttf|https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
  "MesloLGS NF Italic.ttf|https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
  "MesloLGS NF Bold Italic.ttf|https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)

for entry in "${fonts[@]}"; do
  IFS="|" read -r name url <<< "$entry"
  [ ! -f "$name" ] && curl -fLo "$name" "$url"
done

fc-cache -fv

# Install zsh plugins
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions

# Add plugin sources to .zshrc if not already present
grep -qxF 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' ~/.zshrc || echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
grep -qxF 'fpath+=~/.zsh/zsh-completions' ~/.zshrc || echo 'fpath+=~/.zsh/zsh-completions' >> ~/.zshrc

# Optional alias for opening files
grep -qxF 'alias open="xdg-open"' ~/.zshrc || echo 'alias open="xdg-open"' >> ~/.zshrc

echo "✅ Zsh, Powerlevel10k, fzf, and bat installed and configured."
