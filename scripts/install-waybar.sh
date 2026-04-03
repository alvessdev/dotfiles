#!/bin/bash
sudo pacman -S --needed --noconfirm waybar nwg-bar

mv ~/.config/waybar ~/.config/waybar-old
mv ~/.config/nwg-bar ~/.config/nwg-bar-old

stow -d ../ -t ~/ waybar
