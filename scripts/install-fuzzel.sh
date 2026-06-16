#!/bin/bash
sudo pacman -S --needed --noconfirm fuzzel
rm -rf ~/.config/fuzzel &> /dev/null
stow -d ~/dotfiles/ fuzzel
