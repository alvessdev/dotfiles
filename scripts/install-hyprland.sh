#!/usr/bin/env bash
sudo pacman -S --needed --noconfirm stow hyprland curl stow \
	hypridle qt5-wayland qt6-wayland xdg-desktop-portal-hyprland \
	xdg-desktop-portal-gtk xdg-desktop-portal wl-clipboard \
	xdg-utils go nautilus btop hyprpicker pavucontrol
	
	
echo dwindle > hypr/.config/hypr/modules/.active_layout

sudo ln -s ~/dotfiles/hypr/.config/hypr/scripts/hypr-waybar /usr/local/bin/ &> /dev/null
rm -rf ~/.config/hypr &> /dev/null
stow -d ~/dotfiles/ hypr
