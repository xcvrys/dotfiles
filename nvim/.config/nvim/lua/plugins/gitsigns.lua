return {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▏" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "" },
		},
		attach_to_untracked = true,
		current_line_blame = true,
		preview_config = {
			border = "rounded",
		},
	},
	keys = {
		{ "<leader>gd", "<cmd>Gitsigns diffthis<CR>" },
		{ "<leader>gb", "<cmd>Gitsigns blame_line<CR>" },
		{ "<leader>gB", "<cmd>Gitsigns blame<CR>" },
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>" },
	},
}
