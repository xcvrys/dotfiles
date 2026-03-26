return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			disabled_filetypes = { "snacks_dashboard", "snacks_picker_list", "snacks_picker_input" },
			component_separators = "",
			section_separators = "",
			globalstatus = true,
			theme = "rose-pine",
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
				},
			},
			lualine_b = {
				{
					"branch",
					icon = "",
				},
				{
					"diff",
				},
			},
			lualine_c = {
				{ "diagnostics", sources = { "nvim_diagnostic" }, draw_empty = false },
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				{
					"filetype",
					icon_only = true,
					padding = { right = 0 },
				},
				{
					"filename",
					padding = { left = 0 },
					file_status = true,
					shorting_target = 40,
					symbols = {
						modified = "󰏫", -- modified
						readonly = "", -- non-modifiable or readonly
						unnamed = "", -- unnamed buffers
						newfile = "", -- before first writting
					},
				},
			},
		},
	},
	config = function(_, opts)
		local current_theme = require("lualine.themes.rose-pine")

		for _, mode in pairs(current_theme) do
			for section_name, section in pairs(mode) do
				if type(section) == "table" and section_name ~= "a" then
					section.bg = "none"
				end
			end
		end

		opts.options.theme = current_theme
		require("lualine").setup(opts)
	end,
}
