return {
	"RutaTang/compter.nvim",
	config = function()
		require("compter").setup({
			templates = {
				-- for number
				{
					pattern = [[-\?\d\+]],
					priority = 0,
					increase = function(content)
						content = tonumber(content)
						return content + 1, true
					end,
					decrease = function(content)
						content = tonumber(content)
						return content - 1, true
					end,
				},
			},
		})
	end,
}
