return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"html",
			"cssls",
			"lua_ls",
			"pyright",
			"hyprls",
			"jsonls",
			"clangd",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
}
