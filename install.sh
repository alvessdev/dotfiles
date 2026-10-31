#!/usr/bin/env bash
main () {
	installHyprland
}

installPrograms() {
	echo Installing kitty
	./scripts/install-kitty.sh

	echo Installing zsh and plugins
	./scripts/install-zsh.sh
	
	echo Installing nvim
	./scripts/install-nvim.sh

	echo Installing tmux
	./scripts/install-tmux.sh

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
	cp -rL ~/.config/tmux/ ~/old-config &> /dev/null
	cd ~/dotfiles/
}

main $*
