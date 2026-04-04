#/usr/bin/bash
yay -S niri hyprpicker xwayland-satellite xdg-desktop-portal-gnome \
	xdg-desktop-portal-gtk gnome-keyring kitty polkit-kde-agent \
	swaync waypaper swaybg xdg-desktop-portal wl-clipboard cliphist \
	flameshot playerctl network-manager-applet --needed --noconfirm

chmod +x scripts/**

./scripts/install-kitty.sh
./scripts/install-zsh.sh
./scripts/install-nvim.sh
./scripts/install-waybar.sh
./scripts/install-rofi-and-themes.sh
./scripts/configureAll.sh niri
sudo ln -s ~/dotfiles/scripts/global/themed-rofi /usr/local/bin/ &> /dev/null
sudo ln -s ~/dotfiles/niri/.config/niri/scripts/niri-waybar /usr/local/bin/ &> /dev/null
