#!/usr/bin/env bash
main () {
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
}

installPrograms() {
	echo Installing kitty
	./scripts/install-kitty.sh

	echo Installing zsh and plugins
	./scripts/install-zsh.sh
	
	echo Installing nvim
	./scripts/install-nvim.sh

	echo Installing noctalia
	./scripts/install-noctalia.sh

	echo Downloding wallpapers
	./scripts/download-wallpapers.sh
}

installHyprland() {
	backup
	cp -rL ~/.config/hypr ~/old-config &> /dev/null

	echo Installing hyprland
	./scripts/install-hyprland.sh
	installPrograms
}

backup() {
	echo "Creating backup folder with old config files (~/old-config)"
	mkdir ~/old-config/ &> /dev/null
	cp -rL ~/.config/waybar ~/old-config &> /dev/null
	cp -rL ~/.config/nvim ~/old-config &> /dev/null
	cp -L ~/.zshrc ~/old-config &> /dev/null
	cp -L ~/.p10k.zsh ~/old-config &> /dev/null
	cp -rL ~/.config/fuzzel/ ~/old-config &> /dev/null
	cp -rL ~/.config/kitty/ ~/old-config &> /dev/null
	cp -rL ~/.config/noctalia/ ~/old-config &> /dev/null
	cd ~/dotfiles/
}

installNiri() {
	backup
	cp -rL ~/.config/niri ~/old-config &> /dev/null

	echo Installing niri
	./scripts/install-niri.sh
	installPrograms
}

main $*
