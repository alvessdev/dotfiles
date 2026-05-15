---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us, us, br",
		kb_variant = "basic, intl",
		kb_model = "",
		kb_options = "grp:alt_space_toggle",
		repeat_rate = 35,
		repeat_delay = 200,
		kb_rules = "",

		follow_mouse = 1,
		accel_profile = "flat",
		force_no_accel = true,

		scroll_method = "on_button_down",
		scroll_button = 274,
		scroll_button_lock = true,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
	cursor = {
		no_hardware_cursors = 0,
		no_break_fs_vrr = 1,
		min_refresh_rate = 24,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
