#!/bin/bash
sudo pacman -S --needed --noconfirm rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git /tmp/rofi
cd /tmp/rofi
chmod +x ./setup.sh
./setup.sh
