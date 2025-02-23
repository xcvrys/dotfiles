return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",          -- latte, frappe, macchiato, mocha
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = true,  -- shows the '~' characters after the end of buffers
			styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" },  -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				bufferline = true,
				notify = true,
				render_markdown = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				snacks = {
					enabled = true,
					indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		})
	end,
}
