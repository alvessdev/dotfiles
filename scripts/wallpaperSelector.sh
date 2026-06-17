#!/usr/bin/env bash
# get all wallpapers
wallpapers=( $(fd '\.(png|jpeg|avif|jpegxl|gif|pnm|tga|tiff|webp|bmp|farbfeld|svg)$' ~/wallpapers) )
options=""

for wallpaper in "${wallpapers[@]}"; do 
	name=$(basename $wallpaper)
	if [[ $wallpaper == ${wallpapers[-1]} ]]; then
		options+="$name\0icon\x1f$(echo $wallpaper)"
	else
		options+="$name\0icon\x1f$(echo $wallpaper)\n"
	fi
done

index=$(echo -e $options | fuzzel -d --index --line-height 70 --lines 5 --width 35)
awww img ${wallpapers[index]} --transition-type=random --transition-fps=60 
