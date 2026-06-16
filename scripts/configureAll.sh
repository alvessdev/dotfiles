#!/usr/bin/env bash
mkdir ~/old-config &> /dev/null

mv ~/.config/kitty/ ~/old-config &> /dev/null
mv ~/.config/nvim/ ~/old-config &> /dev/null
mv ~/.config/waybar/ ~/old-config &> /dev/null
mv ~/.zshrc ~/old-config &> /dev/null
mv ~/.config/$1/ ~/old-config &> /dev/null

stow kitty &> /dev/null
stow nvim &> /dev/null
stow waybar &> /dev/null
stow zshell &> /dev/null
stow $1 &> /dev/null
