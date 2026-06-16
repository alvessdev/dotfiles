local dsp = hl.dsp
local bind = hl.bind
local cmd = dsp.exec_cmd

-- functions
local windows
local workspace
local fn
local gamemode

local function main()
	bind("SUPER + T", dsp.exec_cmd(terminal))
	local closeWindowBind = bind("SUPER + C", hl.dsp.window.close())
	-- closeWindowBind:set_enabled(false)
	bind("SUPER + E", cmd(fileManager))
	bind("SUPER + V", dsp.window.float({ action = "toggle" }))
	bind("SUPER + U", dsp.window.pseudo())
	bind("SUPER + D", cmd(menu .. " -show drun"))
	bind("SUPER + BACKSPACE", cmd("killall waybar || hypr-waybar"))
	bind("SUPER + P", cmd("killall hyprpicker|| hyprpicker -a"))
	bind(
		"SUPER + period",
		cmd(menu .. " -modi clipboard:" .. scripts_path .. "cliphist-rofi-img.sh -show clipboard -show-icons")
	)
	bind("PRINT", cmd("flameshot gui"))
	bind("SUPER + N", cmd("swaync-client -t -sw"))
	bind("SUPER + SHIFT + P", function()
		hl.timer(function()
			hl.dispatch(hl.dsp.dpms({ action = "disable" }))
		end, { timeout = 500, type = "oneshot" })
	end)
	bind(
		"SUPER + SHIFT + E",
		hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
	)
	bind("SUPER + Y", cmd("killall rofi || " .. scripts_path .. "changeLayout.sh"))
	bind(
		"SUPER + ALT + W",
		cmd(
			"awww img $(shuf -e $(fd '\\.(png|jpeg|avif|jpegxl|gif|pnm|tga|tiff|webp|bmp|farbfeld|svg)$' ~/wallpapers) -n 1) --transition-type=random --transition-fps=60"
		)
	)

	workspace()
	bind("SUPER + CTRL + G", gamemode)
	fn()
	windows()
end

windows = function()
	-- windows binds
	bind("SUPER + F", dsp.window.fullscreen({ mode = "maximized" }))
	bind("SUPER + SHIFT + F", dsp.window.fullscreen({ mode = "fullscreen" }))

	-- move focus
	bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
	bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
	bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
	bind("SUPER + j", hl.dsp.focus({ direction = "down" }))
	bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
	bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
	bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
	bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

	-- move windows
	bind("SUPER + CTRL + h", dsp.window.swap({ direction = "left" }))
	bind("SUPER + CTRL + l", dsp.window.swap({ direction = "right" }))
	bind("SUPER + CTRL + k", dsp.window.swap({ direction = "up" }))
	bind("SUPER + CTRL + j", dsp.window.swap({ direction = "down" }))
	bind("SUPER + CTRL + left", dsp.window.swap({ direction = "left" }))
	bind("SUPER + CTRL + right", dsp.window.swap({ direction = "right" }))
	bind("SUPER + CTRL + up", dsp.window.swap({ direction = "up" }))
	bind("SUPER + CTRL + down", dsp.window.swap({ direction = "down" }))

	-- resize windows
	bind("SUPER + SHIFT + h", dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	bind("SUPER + SHIFT + l", dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	bind("SUPER + SHIFT + k", dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	bind("SUPER + SHIFT + j", dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
	bind("SUPER + SHIFT + left", dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	bind("SUPER + SHIFT + right", dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	bind("SUPER + SHIFT + up", dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	bind("SUPER + SHIFT + down", dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

	-- Move/resize windows with mainMod + LMB/RMB and dragging
	hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
end

workspace = function()
	-- workspaces config
	-- Switch workspaces with mainMod + [0-9]
	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	for i = 1, 10 do
		local key = i % 10 -- 10 maps to key 0
		bind("SUPER + " .. key, dsp.focus({ workspace = i }))
		bind("SUPER + SHIFT + " .. key, dsp.window.move({ workspace = i }))
	end

	bind("SUPER + G", dsp.focus({ workspace = 11 }))
	bind("SUPER + SHIFT + G", dsp.window.move({ workspace = 11 }))
	hl.bind("SUPER" .. " + S", hl.dsp.workspace.toggle_special("magic"))
	hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

	-- Scroll through existing workspaces with mainMod + scroll
	hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

	hl.config({
		binds = {
			workspace_back_and_forth = true,
		},
	})
end

gamemode = function()
	if hl.get_config("animations.enabled") then
		hl.config({
			animations = {
				enabled = false,
			},
			decoration = {
				shadow = {
					enabled = false,
				},
				blur = {
					enabled = false,
				},
				fullscreen_opacity = 1,
				rounding = 0,
				inactive_opacity = 1,
			},
			general = {
				gaps_in = 0,
				gaps_out = 0,
			},
			input = {
				scroll_button = 0,
				scroll_button_lock = false,
				scroll_method = "no_scroll",
			},
		})

		hl.exec_cmd("killall waybar")
		hl.exec_cmd("pkill hypridle")

		hl.notification.create({
			text = "Gamemode [ON]",
			color = "rgb(40a02b)",
			duration = 5000,
		})
		return
	end

	hl.exec_cmd("hyprctl reload")
	hl.exec_cmd("hypr-waybar")
	hl.exec_cmd("hypridle")

	hl.notification.create({
		text = "Gamemode [OFF]",
		color = "rgb(d20f39)",
		duration = 5000,
	})
end

fn = function()
	-- fn keys
	hl.bind(
		"XF86AudioRaiseVolume",
		hl.dsp.exec_cmd("swayosd-client --output-volume 5"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioLowerVolume",
		hl.dsp.exec_cmd("swayosd-client --output-volume -5"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMute",
		hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),
		{ locked = true, repeating = false }
	)
	hl.bind(
		"XF86AudioMicMute",
		hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),
		{ locked = true, repeating = true }
	)
	hl.bind("XF86AudioNext", hl.dsp.exec_cmd("swayosd-client --playerctl next"), { locked = true, repeating = true })
	hl.bind(
		"XF86AudioPrev",
		hl.dsp.exec_cmd("swayosd-client --playerctl previous"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioPause",
		hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioPlay",
		hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"),
		{ locked = true, repeating = true }
	)
end

main()
