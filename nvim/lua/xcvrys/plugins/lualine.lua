return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons",
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
	},
	event = "VeryLazy",
	config = function()
		local custom_catppuccin = require("lualine.themes.catppuccin")

		-- Custom colours
		custom_catppuccin.normal.b.fg = "#cad3f5"
		custom_catppuccin.insert.b.fg = "#cad3f5"
		custom_catppuccin.visual.b.fg = "#cad3f5"
		custom_catppuccin.replace.b.fg = "#cad3f5"
		custom_catppuccin.command.b.fg = "#cad3f5"
		custom_catppuccin.inactive.b.fg = "#cad3f5"

		custom_catppuccin.normal.c.fg = "#6e738d"
		custom_catppuccin.normal.c.bg = "transparent"


		require("lualine").setup({
			options = {
				theme = custom_catppuccin,
				section_separators = "",
				component_separators = "|",
				-- :let @+ = &filetype
				disabled_filetypes = { "snacks_dashboard", "snacks_picker_list", "snacks_picker_input" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(res)
							if res:sub(2, 2) == "-" then
								return res:sub(1, 3)
							else
								return res:sub(1, 1)
							end
						end,
						icon = "",
					},
				},
				lualine_b = {
					{
						"filetype",
						icon_only = false,
						padding = { left = 1, right = 0 },
						color = { fg = "#6e738d", bg = "transparent" },
					},
				},
				lualine_c = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						colored = false,
					},
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "#6e738d" },
					},
					{
						"copilot",
						symbols = {
							status = {
								icons = {
									enabled = "",
									sleep = "󰒲",
									disabled = "",
									unknown = "",
									warning = "",
								},
							},
							spinners = {
								"⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"
							},
						},
						show_colors = false,
						show_loading = true,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
