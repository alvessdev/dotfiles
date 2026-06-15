#!/bin/sh
yay -S --needed --noconfirm stow hyprland swaync awww curl stow \
	hypridle hyprpolkitagent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland \
	xdg-desktop-portal-gtk xdg-desktop-portal network-manager-applet wl-clipboard \
	xdg-utils go cliphist nautilus btop hyprpicker flameshot pavucontrol playerctl \
	
echo dwindle > hypr/.config/hypr/modules/.active_layout

sudo ln -s ~/dotfiles/scripts/global/themed-rofi /usr/local/bin/ &> /dev/null
sudo ln -s ~/dotfiles/hypr/.config/hypr/scripts/hypr-waybar /usr/local/bin/ &> /dev/null
rm -rf ~/.config/hypr &> /dev/null
stow -d ~/dotfiles/ hypr
