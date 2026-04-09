#/usr/bin/bash
pid=$(hyprctl activewindow | grep -i "pid" | awk -F: '{print $2}' | tr --delete ' ')
nextSize=1
currentSize=$(cat /tmp/hyprland/$pid) &> /dev/null
if [[ $currentSize == "1" ]] then
	nextSize=0.5
fi
hyprctl dispatch layoutmsg colresize $nextSize
echo $nextSize > /tmp/hyprland/$pid
