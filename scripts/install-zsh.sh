#!/bin/bash
sudo pacman -S --needed --noconfirm zsh fzf ripgrep eza bat fd
./install-zsh-plugins.sh
chsh -s $(which zsh)

mv ~/.zshrc ~/.zshrc-old
stow -d ../ -t ~/ zshell
