#!/usr/bin/bash
if [[ $# -eq 0 ]] then
	echo "Usage: install <argument>"
	echo "Arguments: niri or hyprland"
elif [[ $1 == "hyprland" ]] then
	installHyprland
elif [[ $1 == "niri" ]] then
	installNiri
else
	echo Invalid argument
fi

installPrograms() {
	echo Installing yay
	./scripts/install-yay.sh

	echo Installing kitty
	./scripts/install-kitty.sh

	echo Installing zsh and plugins
	./scripts/install-zsh.sh
	
	echo Installing nvim
	./scripts/install-nvim.sh

	echo Installing waybar
	./scripts/install-waybar.sh

	echo Installing rofi and themes from https://github.com/adi1090x/rofi
	./scripts/install-rofi-and-themes.sh
}

installHyprland() {
	backup
	cp -r ~/.config/hypr ~/old-config &> /dev/null
	echo Installing hyprland
	./scripts/install-hyprland.sh
	installPrograms
}

backup() {
	echo "Creating backup folder with old config files (~/old-config)"
	mkdir ~/old-config/ &> /dev/null
	cp -r ~/.config/waybar ~/old-config &> /dev/null
	cp -r ~/.config/nvim ~/old-config &> /dev/null
	cp ~/.zshrc ~/old-config &> /dev/null
	cp ~/.p10k.zsh ~/old-config &> /dev/null
	cp -r ~/.config/rofi/ ~/old-config &> /dev/null
	cp -r ~/.config/kitty/ ~/old-config &> /dev/null
}

installNiri() {
	backup
	cp -r ~/.config/niri ~/old-config &> /dev/null
	echo Installing niri
	./scripts/install-niri.sh
	installPrograms
}
