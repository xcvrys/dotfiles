return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			transparent = true, -- do not set background color
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true,
			theme = "wave",
			background = {
				dark = "wave",
			},
			overrides = function(colors)
				local theme = colors.theme

				---@param fg? string The hex color or color name (optional)
				---@return table { bg: string, fg?: string }
				local function transparent(fg)
					return { bg = "none", fg = fg }
				end

				return {
					Pmenu = transparent(),
					NormalFloat = transparent(theme.ui.float.fg_border),
					FloatBorder = transparent(theme.ui.float.fg_border),
					FloatTitle = transparent(),
					EndOfBuffer = { link = "LineNr" },
					SignColumn = transparent(theme.ui.float.fg_border),
					LineNr = transparent(theme.ui.nontext),
					CursorLineNr = transparent(theme.diag.warning),
					CursorLine = { bg = theme.diff.text },
					StatusLine = transparent("none"),
					StatusLineNC = transparent("none"),
					DiagnosticSignHint = transparent(),
					DiagnosticSignInfo = transparent(),
					DiagnosticSignWarn = transparent(),
					DiagnosticSignOk = transparent(),
					TabLine = transparent(),
					TabLineFill = transparent(),
					GitSignsDelete = transparent(),
					GitSignsChange = transparent(),
					GitSignsAdd = transparent(),
					BufferlineSeparator = transparent(theme.ui.float.fg_border),
					BlinkCmpMenuBorder = { link = "BlinkCmpDocBorder" },
					BlinkCmpMenuSelection = { bg = theme.diff.text },
					BlinkCmpScrollBarThumb = { bg = theme.ui.float.fg_border },
				}
			end,
		})

		vim.cmd([[colorscheme kanagawa]])
	end,
}
