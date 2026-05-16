#!/bin/bash
hyprModulesPath="$HOME/.config/hypr/modules"
option=$(printf 'Dwindle\nScrolling\nMaster\nMonocle' | themed-rofi -dmenu -i -p "Layout")
if [[ $option == "Dwindle" ]] ; then
	echo dwindle > "$hyprModulesPath/.active_layout"
elif [[ $option == "Scrolling" ]] then
	echo scrolling > "$hyprModulesPath/.active_layout"
elif [[ $option == "Master" ]] then
	echo master > "$hyprModulesPath/.active_layout"
elif [[ $option == "Monocle" ]] then
	echo monocle > "$hyprModulesPath/.active_layout"
fi

hyprctl reload
