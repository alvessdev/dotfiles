sudo pacman -S tmux --needed --noconfirm
rm -rf ~/.config/tmux &> /dev/null
stow -d ~/dotfiles/ tmux
