return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┃" },
			},
			signcolumn = true, -- toggle with `:Gitsigns toggle_signs`
			linehl = false, -- toggle with `:Gitsigns toggle_linehl`
			numhl = false, -- toggle with `:Gitsigns toggle_nunhl`
			word_diff = false, -- toggle with `:Gitsigns toggle_word_diff`
			sign_priority = 9,
			watch_gitdir = {
				interval = 1000,
			},
			attach_to_untracked = true,
		})

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
		end

		local function confirm(action, action_display)
			return function()
				vim.ui.input({ prompt = "confirm " .. action_display .. " (y/n): " }, function(input)
					if input == "y" then
						action()
					end
				end)
			end
		end

		-- navigation
		map("n", "]h", gitsigns.next_hunk, "Next Hunk")
		map("n", "[h", gitsigns.prev_hunk, "Prev Hunk")

		-- Actions
		map("n", "<leader>ghs", confirm(gitsigns.stage_hunk, "Stage hunk"), "Stage hunk")
		map("n", "<leader>ghr", confirm(gitsigns.reset_hunk, "Reset hunk"), "Reset hunk")
		map("n", "<leader>ghS", confirm(gitsigns.stage_buffer, "Stage buffer"), "Stage buffer")
		map("n", "<leader>ghR", confirm(gitsigns.reset_buffer, "Reste buffer"), "Reset buffer")

		map("n", "<leader>ghu", confirm(gitsigns.undo_stage_hunk, "Undo stage hunk"), "Undo stage hunk")

		map("n", "<leader>ghp", gitsigns.preview_hunk, "Preview hunk")

		map("n", "<leader>ghB", function()
			gitsigns.blame_line({ full = true })
		end, "Blame line")
		map("n", "<leader>ghb", gitsigns.toggle_current_line_blame, "Toggle line blame")

		map("n", "<leader>ghd", gitsigns.diffthis, "Diff this")
		map("n", "<leader>ghD", function()
			gitsigns.diffthis("~")
		end, "Diff this ~")
	end,
}
