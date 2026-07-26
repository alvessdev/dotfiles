#!/usr/bin/env bash
sudo pacman -S niri stow nautilus curl hyprpicker xwayland-satellite xdg-desktop-portal-gnome \
	xdg-desktop-portal-gtk gnome-keyring kitty polkit-kde-agent \
	swaync swayosd awww xdg-desktop-portal wl-clipboard cliphist \
	flameshot playerctl network-manager-applet --needed --noconfirm

sudo ln -s ~/dotfiles/niri/.config/niri/scripts/niri-waybar /usr/local/bin/ &> /dev/null
rm -rf ~/.config/niri &> /dev/null
stow -d ~/dotfiles/ niri
