#/usr/bin/bash
mkdir ~/old-config

mv ~/.config/kitty/ ~/old-config
mv ~/.config/nvim/ ~/old-config
mv ~/.config/waybar/ ~/old-config
mv ~/.zshrc ~/old-config
mv ~/.config/$1/ ~/old-config

stow kitty
stow nvim
stow waybar
stow zshell
stow $1
