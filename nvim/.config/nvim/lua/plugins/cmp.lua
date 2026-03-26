return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		"nvim-tree/nvim-web-devicons",
	},
	version = "1.*",
	---@module 'blink.cmp'
	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			menu = { border = "rounded" },
			range = "full",
			documentation = {
				window = { border = "rounded" },
				auto_show = true,
				auto_show_delay_ms = 100,
			},
		},
		signature = {
			enabled = true,
			trigger = { show_on_insert = true },
			window = { border = "rounded" },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
