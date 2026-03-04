local severity = vim.diagnostic.severity

vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})

local key = vim.keymap
local lsp = vim.lsp

key.set("n", "gd", lsp.buf.definition, { desc = "Goto definition" })
key.set("n", "gr", lsp.buf.references, { desc = "Show references" })
key.set("n", "gI", lsp.buf.implementation, { desc = "Goto implementation" })
key.set("n", "gy", lsp.buf.type_definition, { desc = "Type definition" })
key.set("n", "gD", lsp.buf.declaration, { desc = "Goto declaration" })
key.set("n", "K", lsp.buf.hover, { desc = "Hover" })
key.set("n", "gk", lsp.buf.signature_help, { desc = "Signature help" })
key.set("n", "<leader>ca", lsp.buf.code_action, { desc = "Code actions" })
key.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show line diagnostic" })
key.set("n", "<leader>dn", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
key.set("n", "<leader>dp", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
key.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename" })
