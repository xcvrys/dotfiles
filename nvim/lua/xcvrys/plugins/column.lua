---@type number
local col
return {
	"hankertrix/nerd_column.nvim",
	event = { "BufEnter" },
	opts = {
		disabled_file_types = { "snacks_dashboard" },
		scope = "window",
		transform_colour_column = function(colour_column)
			return colour_column + 1
		end,
		custom_colour_column = function()
			if col then
				return col
			end

			local cwd = vim.fn.getcwd()
			local filenames = { ".prettierrc", ".prettierrc.json", ".prettierrc.js" }
			local print_width = 80

			for _, filename in ipairs(filenames) do
				local file_path = cwd .. "/" .. filename

				-- Only continue if the file is readable
				if vim.fn.filereadable(file_path) == 1 then
					local file = io.open(file_path, "r")
					if file then
						print("Found file: " .. file_path)
						local content = file:read("*all")
						file:close()

						-- Extract printWidth value
						local width = content:match('[\\"\'%s]printWidth[\\"\'%s]?%s*[:=]%s*(%d+)')
						if width then
							---@diagnostic disable-next-line: cast-local-type
							print_width = tonumber(width)
							break
						end
					end
				end
			end


			col = print_width
			return col
		end
	}
}
