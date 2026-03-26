return {
	{
		"lewis6991/hover.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			providers = {
				"hover.providers.diagnostic",
				"hover.providers.lsp",
				"hover.providers.man",
				"hover.providers.dictionary",
				"hover.providers.gh",
			},
			preview_opts = {
				border = "rounded",
				max_width = 80,
			},
			title = true,
		},

		config = function(_, opts)
			local hover = require("hover")
			hover.setup(opts)
			vim.keymap.set("n", "K", hover.open, { desc = "hover.nvim" })
		end,
	},
}
