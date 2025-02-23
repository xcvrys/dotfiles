return {
	'akinsho/bufferline.nvim',
	version = "*",
	after = "catppuccin",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		local bufferline = require("bufferline")
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- Define common highlight groups
		local transparent_bg = { bg = 'none' }
		local highlight_groups = {
			'fill', 'background', 'tab', 'tab_selected', 'tab_separator', 'tab_separator_selected',
			'buffer_visible', 'buffer_selected', 'numbers', 'numbers_visible', 'numbers_selected',
			'diagnostic', 'diagnostic_visible', 'diagnostic_selected', 'hint', 'hint_visible',
			'hint_selected', 'hint_diagnostic', 'hint_diagnostic_visible', 'hint_diagnostic_selected',
			'info', 'info_visible', 'info_selected', 'info_diagnostic', 'info_diagnostic_visible',
			'info_diagnostic_selected', 'warning', 'warning_visible', 'warning_selected',
			'warning_diagnostic', 'warning_diagnostic_visible', 'warning_diagnostic_selected',
			'error', 'error_visible', 'error_selected', 'error_diagnostic', 'error_diagnostic_visible',
			'error_diagnostic_selected', 'modified', 'modified_visible', 'modified_selected',
			'separator_selected', 'separator_visible', 'separator', 'indicator_visible', 'indicator_selected'
		}

		local highlights = {}
		for _, group in ipairs(highlight_groups) do
			highlights[group] = transparent_bg
		end
		highlights.separator = vim.tbl_extend("keep", transparent_bg, { fg = 'none' })

		-- Common close command function
		local function close_buffer(n)
			Snacks.bufdelete(n)
		end

		bufferline.setup {
			highlights = highlights,
			options = {
				close_command = close_buffer,
				right_mouse_command = close_buffer,
				themable = true,
				show_buffer_close_icons = false,
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				auto_toggle_bufferline = true,
				style_preset = bufferline.style_preset.no_italic,
				separator_style = "thin",
				---@diagnostic disable-next-line: redefined-local
				numbers = function(opts)
					return tostring(opts.ordinal)
				end,
				offsets = {
					{
						filetype = "snacks_layout_box",
						text = "",
						highlight = "EcovimNvimTreeTitle",
						text_align = "center",
						separator = true,
					},
				},
			},
		}

		-- Key mappings
		keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
		keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)

		for i = 1, 9 do
			keymap("n", "<A-" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
		end
	end,
}
