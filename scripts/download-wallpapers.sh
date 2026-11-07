#!/usr/bin/env bash
git clone https://github.com/atraxsrc/tokyonight-wallpapers.git ~/wallpapers
cd ~/wallpapers/
if [[ $? -eq 0 ]]; then
	git reset --hard 555d905e
	rm -rf .git
	rm $(/usr/bin/ls ~/wallpapers | grep upscay -i)
	cd -
fi
