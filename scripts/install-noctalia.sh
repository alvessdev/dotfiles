sudo pacman -S noctalia --needed --noconfirm
rm -rf ~/.config/noctalia &> /dev/null
stow -d ~/dotfiles/ noctalia
