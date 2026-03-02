local opt = vim.opt

-- leader key for custom remap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nerdfonts icons
vim.g.have_nerd_font = true

-- show numbers and relative number
opt.number = true
opt.relativenumber = true

-- mouse mode (on)
opt.mouse = "a"

-- show mode in status bar (false)
opt.showmode = false

-- share clipboard with system
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Wrapped line will continue visually indented
opt.breakindent = true

-- vim automatically deletes the undofile.
opt.undofile = true

-- ignore case when searching
opt.ignorecase = true

-- override the 'ignorecase' option if the search pattern contains upper case characters
opt.smartcase = true

opt.signcolumn = "yes"

-- time in milliseconds to wait for a mapped sequence to complete
opt.timeoutlen = 500

-- time(ms) to update swapfile when nothing is typed
opt.updatetime = 1000

-- split location
opt.splitright = true
opt.splitbelow = true

-- enable visible spaces, tabs etc and change the default configs of list
opt.list = true
opt.listchars = { tab = "▎ ", trail = "·", nbsp = "␣" }

-- realtime for substitute
opt.inccommand = "split"

-- highlight the current line
opt.cursorline = true

-- minimum distance between edges of screen (up and down) relative to the cursorline
opt.scrolloff = 10

opt.confirm = true

-- copy indent from current line when starting a new line
opt.autoindent = true

-- improve autoindent for c like languages ()
opt.smartindent = true

-- tab config
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smarttab = true
-- opt.expandtab = true

-- maximum number of changes that can be undone
opt.undolevels = 10000

-- enables 24-bit RGB color
opt.termguicolors = true

-- automatically line wrap
opt.wrap = true

-- fold config
opt.foldmethod = "indent"
opt.foldlevel = 99

-- Highligh copied text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highligh when yanking text",
	callback = function()
		vim.highlight.on_yank()
	end,
})
