hl.on("hyprland.start", function()
	hl.exec_cmd(
		"awww-daemon --no-cache & sleep 2 && awww img $(shuf -e $(fd '\\.(png|jpeg|avif|jpegxl|gif|pnm|tga|tiff|webp|bmp|farbfeld|svg)$' ~/wallpapers) -n 1) --transition-type=random --transition-fps=60"
	)
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hypr-waybar")
	hl.exec_cmd("aa-notify -p -s 1 -w 60 -f /var/log/audit/audit.log")

	--audio
	hl.exec_cmd("swayosd-server")

	--notificação
	hl.exec_cmd("swaync")

	--clipboard
	hl.exec_cmd("cliphist wipe")
	hl.exec_cmd("wl-paste --watch cliphist store")

	hl.exec_cmd("hypridle")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("mkdir /tmp/hyprland")
end)
