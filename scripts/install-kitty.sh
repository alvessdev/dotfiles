#!/usr/bin/env bash
sudo pacman -S --needed --noconfirm kitty ttf-iosevkaterm-nerd
rm -rf ~/.config/kitty &> /dev/null
stow -d ~/dotfiles/ kitty
