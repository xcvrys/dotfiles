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
		local theme = require("lualine.themes.rose-pine")

		for _, mode in pairs(theme) do
			if type(mode) == "table" then
				-- 1. Create/Override Z: Use A's background for Z's foreground
				-- We do this first so it has its own table reference
				if mode.a then
					mode.z = { fg = mode.a.bg, bg = "none" }
				end

				-- 2. Clean up everything else
				for name, section in pairs(mode) do
					if type(section) == "table" and name ~= "a" and name ~= "z" then
						section.bg = "none"
					end
				end
			end
		end

		opts.options.theme = theme
		require("lualine").setup(opts)
	end,
}
