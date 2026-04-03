#!/bin/sh
chmod +x scripts/**

yay -S --needed --noconfirm stow hyprland swaync waypaper swaybg curl stow \
	hypridle hyprpolkitagent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland \
	xdg-desktop-portal-gtk xdg-desktop-portal network-manager-applet wl-clipboard \
	xdg-utils go cliphist nautilus btop hyprpicker flameshot pavucontrol playerctl \
	
echo '''
general {
	layout = master
}

source = $HOME/.config/hypr/modules/layouts/master/master.conf
''' >> hypr/.config/hypr/modules/current-layout.conf

./scripts/install-kitty.sh
./scripts/install-zsh.sh
./scripts/install-nvim.sh
./scripts/install-waybar.sh
./scripts/install-rofi-and-themes.sh
./scripts/configureAll.sh hypr
