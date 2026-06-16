#!/usr/bin/env bash
sudo pacman -S --needed --noconfirm waybar nwg-bar
rm -rf ~/.config/waybar &> /dev/null
rm -rf ~/.config/nwg-bar &> /dev/null
stow -d ~/dotfiles/ waybar
