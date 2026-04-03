#!/bin/sh
sudo pacman -S --needed --noconfirm hyprland swaync waypaper swaybg \
	hypridle hyprpolkitagent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland \
	xdg-desktop-portal-gtk xdg-desktop-portal network-manager-applet wl-clipboard \
	xdg-utils go cliphist nautilus btop hyprpicker flameshot pavucontrol playerctl \
	
echo '''
general {
	layout = master
}

source = $HOME/.config/hypr/modules/layouts/master/master.conf
''' >> hyprland/.config/hypr/modules/current-layout.conf
stow -t ~/ hyprland

chmod +x scripts/**
scripts/install-kitty.sh
scripts/install-zsh.sh
scripts/install-nvim.sh
scripts/install-waybar.sh
