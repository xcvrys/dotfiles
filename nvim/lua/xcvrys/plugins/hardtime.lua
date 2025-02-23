return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disabled_keys = {
			["<Up>"] = {},
			["<Down>"] = {},
			["<Right>"] = {},
			["<Left>"] = {},
			["<Space>"] = { "n", "x" },
		},
	}
}
