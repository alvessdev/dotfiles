#!/bin/bash
hyprModulesPath="$HOME/.config/hypr/modules"
opt=$(echo $1 | awk '{print tolower($0)}')
echo $opt > "$hyprModulesPath/.active_layout"

hyprctl reload
