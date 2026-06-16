#!/usr/bin/env bash
sudo pacman -S --needed --noconfirm kitty ttf-jetbrains-mono-nerd
rm -rf ~/.config/kitty &> /dev/null
stow -d ~/dotfiles/ kitty
