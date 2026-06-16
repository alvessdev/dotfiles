#!/usr/bin/env bash
git clone https://github.com/atraxsrc/tokyonight-wallpapers.git ~/wallpapers
cd ~/wallpapers/
rm $(/usr/bin/ls ~/wallpapers | grep upscay -i)
cd -
