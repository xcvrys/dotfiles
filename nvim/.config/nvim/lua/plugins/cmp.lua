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
		keymap = {
			preset = "super-tab",
			["<C-h>"] = { "snippet_backward", "fallback" },
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-Left>"] = { "snippet_backward", "fallback" },
			["<C-Right>"] = { "snippet_forward", "fallback" },
		},
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
			default = { "snippets", "lsp", "path", "buffer" },
			providers = {
				snippets = {
					opts = {
						search_paths = { vim.fn.stdpath("config") .. "/snippets" },
					},
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
