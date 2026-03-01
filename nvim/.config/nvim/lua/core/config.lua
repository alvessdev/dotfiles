vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_foptnt = true
vim.opt.number = true
vim.opt.mouse = "a"
-- vim.shoptwmode = false
vim.opt.relativenumber = true
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 500
vim.opt.updatetime = 1000
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.listchars = { tab = "▎ ", trail = "·", nbsp = "␣" }
vim.opt.confirm = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.undolevels = 10000
vim.opt.termguicolors = true
vim.opt.wrap = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.smarttab = true
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Moptve focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Moptve focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Moptve focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Moptve focus to the upper window' })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highligh when yanking text",
	callback = function()
		vim.highlight.on_yank()
	end,
})
