#!/bin/bash
sudo pacman -S --needed --noconfirm zsh tldr man-pages man-db fzf curl ripgrep eza bat fd
~/dotfiles/scripts/install-zsh-plugins.sh
rm ~/.zshrc &> /dev/null
rm ~/.p10k.zsh &> /dev/null
stow -d ~/dotfiles/ zshell
