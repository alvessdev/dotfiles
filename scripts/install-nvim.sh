#!/bin/bash
sudo pacman -S --needed --noconfirm neovim ripgrep tar curl ttf-jetbrains-mono-nerd

mv ~/.config/nvim ~/.config/nvim-old
stow -d ../ -t ~/ nvim
