hl.window_rule({
	match = {
		initial_title = "Steam — Configurações",
	},
	float = true,
	center = true,
})

hl.window_rule({
	match = {
		initial_title = "Picture-in-Picture",
	},
	opaque = true,
	float = true,
	keep_aspect_ratio = true,
	size = { 720, 405 },
	pin = true,
})

hl.window_rule({
	match = {
		class = "app.zen_browser.zen",
	},
	opaque = true,
})

hl.window_rule({
	match = {
		title = "^(.*nvim.*)$",
	},
	opaque = true,
})

local floatWindows = { "blueman-manager", "waypaper", "org.pulseaudio.pavucontrol" }

for i = 1, #floatWindows do
	hl.window_rule({
		match = {
			class = floatWindows[i],
		},
		float = true,
	})
end

--games rules
-- initial_class of games
local games = { "^(steam_app_.*)$", "^(Minecraft*.*)$", "^(blackops.*)$", "^(Hollow.*)$" }

for i = 1, #games do
	hl.window_rule({
		match = {
			initial_class = games[i],
		},
		content = "game",
		workspace = "11 silent",
	})
end

hl.window_rule({
	match = {
		initial_title = "^(Terraria.*)$",
	},
	content = "game",
	workspace = "11 silent",
})
--

hl.window_rule({
	match = {
		initial_title = "^(Enter name of file to save to….*)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	match = {
		initial_title = "^(File Upload.*)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	match = {
		title = "File Operation Progress",
	},
	float = true,
	center = true,
})

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

-- Hyprland-run windowrule
-- hl.window_rule({
-- 	name = "move-hyprland-run",
-- 	match = { class = "hyprland-run" },
--
-- 	move = "20 monitor_h-120",
-- 	float = true,
-- })
