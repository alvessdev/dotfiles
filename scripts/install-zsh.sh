#!/usr/bin/env bash
sudo pacman -S --needed --noconfirm zsh tldr man-pages man-db fzf curl ripgrep eza bat fd zoxide
~/dotfiles/scripts/install-zsh-plugins.sh
rm ~/.zshrc &> /dev/null
rm ~/.p10k.zsh &> /dev/null
stow -d ~/dotfiles/ zshell
