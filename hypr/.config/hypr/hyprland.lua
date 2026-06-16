local function main()
	_G.terminal = "kitty"
	_G.fileManager = "nautilus"
	_G.menu = "killall fuzzel || fuzzel"

	local home = os.getenv("HOME")
	_G.hypr_path = home .. "/.config/hypr/"
	_G.scripts_path = hypr_path .. "scripts/"

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
	require("modules.layout")
end

function _G.dbg(txt)
	hl.notification.create({
		text = txt,
		duration = 3000,
	})
end

main()
