-- Programs
terminal = "kitty"
fileManager = "nautilus"
menu = "killall rofi || themed-rofi"
scripts = "$HOME/.config/hypr/scripts"

require("modules.monitors")
require("modules.autostart")
require("modules.env")
require("modules.permissions")
require("modules.misc")
require("modules.general")
require("modules.deco")
require("modules.animations")
require("modules.input")
require("modules.binds")
require("modules.rules")

hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
		permanent_direction_override = false,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})
