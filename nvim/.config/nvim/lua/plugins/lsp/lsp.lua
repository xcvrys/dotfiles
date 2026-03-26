return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
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
				},
			},
		},
		opts = {
			ensure_installed = {
				"ts_ls",
				"html",
				"emmet_ls",
				"yamlls",
				"lua_ls",
				"vimls",
				"eslint",
				"gopls",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"gofumpt",
				"goimports",
				"prettierd",
				"prettier",
				"isort",
				"black",
				"pylint",
				"eslint_d",
			},
		},
	},
}
