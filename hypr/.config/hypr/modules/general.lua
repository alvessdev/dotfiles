hl.config({
	general = {
		gaps_in = 10,
		gaps_out = 20,

		border_size = 2,

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = true,
		col = {
			active_border = { colors = { "rgba(7cceffee)", "rgba(6887ccee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
	},
})
