#!/bin/bash
sudo pacman -S --needed --noconfirm kitty ttf-jetbrains-mono-nerd
mv ~/.config/kitty ~/.config/kitty-old
stow -d ../ -t ~/ kitty
