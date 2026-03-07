#!/bin/bash
hyprModulesPath="$HOME/.config/hypr/modules"
rofi="$HOME/.config/rofi/launcher.sh"
option=$(printf 'Dwindle\nScrolling\nMaster\nMonocle' | $rofi -dmenu -i -p "Layout")
if [[ $option == "Dwindle" ]] ; then
	cp "$hyprModulesPath/layouts/dwindle/dwindle-layout.conf" "$hyprModulesPath/current-layout.conf"
elif [[ $option == "Scrolling" ]] then
	cp "$hyprModulesPath/layouts/scrolling/scrolling-layout.conf" "$hyprModulesPath/current-layout.conf"
elif [[ $option == "Master" ]] then
	cp "$hyprModulesPath/layouts/master/master-layout.conf" "$hyprModulesPath/current-layout.conf"
elif [[ $option == "Monocle" ]] then
	cp "$hyprModulesPath/layouts/monocle/monocle-layout.conf" "$hyprModulesPath/current-layout.conf"
fi
hyprctl reload
