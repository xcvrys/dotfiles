return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	-- event = { "BufReadPost", "BufNewFile" },
	lazy = false,
	main = "nvim-treesitter.configs",
	branch = "master",
	opts = {
		ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "csv", "json" },
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			vim.notify("[nvim.treesitter] plugin load error")
			return
		end
		configs.setup(opts)
	end,
}
