#!/bin/bash
sudo pacman -S --needed --noconfirm rofi
git clone --depth=1 https://github.com/adi1090x/rofi.git /tmp/rofi
cd /tmp/rofi
chmod +x ./setup.sh
./setup.sh
rofiPath="$HOME/.config/rofi/"
touch "$rofiPath/launcher.sh"
echo \
'''#!/bin/bash
rofi -theme "launchers/type-4/style-2.rasi" $*
''' >> "$rofiPath/launcher.sh"
chmod +x "$rofiPath/launcher.sh"

