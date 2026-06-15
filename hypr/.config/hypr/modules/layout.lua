local layouts = { "master", "dwindle", "scrolling", "monocle" }
local is_layout

local change_layout = {}

local function main()
	hl.config({
		dwindle = {
			preserve_split = true, -- You probably want this
			permanent_direction_override = false,
		},
		master = {
			new_status = "master",
		},
		scrolling = {
			fullscreen_on_one_column = true,
			column_width = 0.5,
			focus_fit_method = 1,
			follow_focus = true,
			follow_min_visible = 0.4,
		},
	})
	local file = io.open(hypr_path .. "modules/.active_layout", "r")

	if file then
		local file_layout = file:read()

		if is_layout(file_layout) then
			change_layout[file_layout]()
		else
			change_layout.dwindle()
		end
		file:close()
		return
	end
	change_layout.dwindle()
end

is_layout = function(layout)
	for i = 1, #layouts do
		if layout == layouts[i] then
			return true
		end
	end
	return false
end

change_layout.dwindle = function()
	hl.config({
		general = {
			layout = "dwindle",
		},
	})
	hl.bind("SUPER + Z", hl.dsp.layout("togglesplit"))
end

change_layout.master = function()
	hl.config({
		general = {
			layout = "master",
		},
	})
end

change_layout.scrolling = function()
	hl.config({
		general = {
			layout = "scrolling",
		},
	})
	hl.unbind("SUPER + SHIFT + left")
	hl.unbind("SUPER + SHIFT + right")
	hl.unbind("SUPER + SHIFT + h")
	hl.unbind("SUPER + SHIFT + l")
	hl.unbind("SUPER + F")

	hl.bind("SUPER + SHIFT + left", hl.dsp.layout("colresize -0.1"))
	hl.bind("SUPER + SHIFT + h", hl.dsp.layout("colresize -0.1"))
	hl.bind("SUPER + SHIFT + right", hl.dsp.layout("colresize +0.1"))
	hl.bind("SUPER + SHIFT + l", hl.dsp.layout("colresize +0.1"))

	hl.bind("SUPER + minus", hl.dsp.layout("colresize -0.1"))
	hl.bind("SUPER + equal", hl.dsp.layout("colresize +0.1"))

	hl.bind("SUPER + r", hl.dsp.layout("colresize +conf"))
	hl.bind("SUPER + w", hl.dsp.layout("fit visible"))
	hl.bind("SUPER + SHIFT + w", hl.dsp.layout("fit all"))
	hl.bind("SUPER + F", function()
		local window_size = hl.get_active_window().size
		local max_width = hl.get_active_monitor().width
		local percentage = window_size.x * 100 / max_width
		if percentage >= 95 then
			hl.dispatch(hl.dsp.layout("colresize 0.4"))
			return
		end
		hl.dispatch(hl.dsp.window.fullscreen({ mode = "maximized" }))
	end)
end

change_layout.monocle = function()
	hl.config({
		general = {
			layout = "monocle",
		},
	})
end

main()
