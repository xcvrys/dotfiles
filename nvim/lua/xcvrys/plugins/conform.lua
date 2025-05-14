return {
	{
		"zapling/mason-conform.nvim",
		event = "BufReadPre",
		config = true,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				["*"] = { "codespell" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "yamlfmt" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				go = { "gofmt" },
				svelte = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			async = true,
			lsp_fallback = true
		},
	},
}
