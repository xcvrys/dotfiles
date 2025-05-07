return {
	"luckasRanarison/tailwind-tools.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim"
	},
	config = function()
		require("tailwind-tools").setup({
			document_color = {
				enabled = true,
			},
			conceal = {
				enabled = false,
				min_length = 120,
				symbol = "󱏿",
				highlight = {
					fg = "#38BDF8",
				},
			},
		})
		vim.keymap.set("n", "<leader>ts", "<cmd>:TailwindSort<cr>", { noremap = true, silent = true })
	end,
}
