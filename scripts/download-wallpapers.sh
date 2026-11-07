#!/usr/bin/env bash
git clone https://github.com/atraxsrc/tokyonight-wallpapers.git ~/wallpapers
cd ~/wallpapers/
git reset --hard 934ab9932f8074fe1f96a07cac5926c62760caf5
rm $(/usr/bin/ls ~/wallpapers | grep upscay -i)
cd -
