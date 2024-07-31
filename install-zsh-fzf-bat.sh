#!/bin/bash

# Update package list and install necessary packages
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm zsh fzf bat xclip git curl

# Change default shell to zsh
chsh -s $(which zsh) $(whoami)

# Install Powerlevel10k theme
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /opt/powerlevel10k
echo 'source /opt/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Install Meslo Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -fLo "MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -fLo "MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -fLo "MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

fc-cache -fv

# Install zsh plugins: zsh-autosuggestions and zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions

# Add plugins and source them in .zshrc
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc
echo 'source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh' >>~/.zshrc

# Add alias for fzf in preview mode
echo 'alias open="fzf --preview \"bat --color=always {}\" --bind \"ctrl-c:execute-silent(bat {} | xclip -selection clipboard)\""' >> ~/.zshrc

# Install fzf if it's not already installed
if [[ -f /usr/share/fzf/shell/completion.zsh ]]; then
    /usr/share/fzf/shell/completion.zsh --completion --key-bindings --no-update-rc
fi

if [[ -f /usr/share/fzf/shell/key-bindings.zsh ]]; then
    /usr/share/fzf/shell/key-bindings.zsh --completion --key-bindings --no-update-rc
fi


echo "Installation and configuration completed. Please restart your terminal and RUN 'source ~/.zshrc'"
