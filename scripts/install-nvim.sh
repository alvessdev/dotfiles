#!/usr/bin/env bash
sudo pacman -S --needed --noconfirm neovim make ripgrep tar curl ttf-jetbrains-mono-nerd npm unzip
rm -rf ~/.config/nvim &> /dev/null
stow -d ~/dotfiles/ nvim
