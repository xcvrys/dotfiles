return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			indicator = {
				icon = "",
			},
			buffer_close_icon = "",
			separator_style = { "", "" },
			diagnostics = "nvim_lsp",
			modified_icon = " ",
		},
	},
	config = function(_, opts)
		local highlights = require("rose-pine.plugins.bufferline")
		require("bufferline").setup(opts, { highlights = highlights })

		local map = vim.api.nvim_set_keymap
		local k_opts = { noremap = true, silent = true }

		map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", k_opts)
		map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", k_opts)
	end,
}
