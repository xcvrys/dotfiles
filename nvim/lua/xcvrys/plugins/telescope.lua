return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim", -- telescope dependency
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fzf
		"nvim-tree/nvim-web-devicons", -- icons
		"folke/todo-comments.nvim", -- find todos
		"aznhe21/actions-preview.nvim", -- preview actions in telescope
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function()
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				preview = {
					mime_hook = function(filepath, bufnr, opts)
						local is_image = function()
							local image_extensions = { "png", "jpg" }
							local split_path = vim.split(filepath:lower(), ".", { plain = true })
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image() then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _)
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d .. "\r\n")
								end
							end
							vim.fn.jobstart({
								"chafa", -- https://github.com/hpjansson/chafa
								filepath,
							}, { on_stdout = send_output, stdout_buffered = true, pty = true })
						else
							require("telescope.previewers.utils").set_preview_message(
								bufnr,
								opts.winid,
								"Binary cannot be previewed"
							)
						end
					end,
				},
				path_display = { "smart" },
				file_ignore_patterns = {
					"target/",
					"%.lock",
					"__pycache__/*",
					"%.sqlite3",
					"node_modules/*",
					"%.svg",
					"%.otf",
					"%.ttf",
					"%.webp",
					".gradle/",
					".idea/",
					"__pycache__/",
					"build/",
					"env/",
					"gradle/",
					"node_modules/",
					"%.pdb",
					"%.dll",
					"%.class",
					"%.exe",
					"%.cache",
					"%.ico",
					"%.pdf",
					"%.dylib",
					"%.jar",
					"%.docx",
					"%.met",
					"%.burp",
					"%.mp4",
					"%.mkv",
					"%.rar",
					"%.zip",
					"%.7z",
					"%.tar",
					"%.bz2",
					"%.epub",
					"%.flac",
					"%.tar.gz",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		require("actions-preview").setup({
			telescope = {
				sorting_strategy = "ascending",
				layout_strategy = "vertical",
				layout_config = {
					width = 0.6,
					height = 0.9,
					prompt_position = "top",
					preview_cutoff = 20,
					preview_height = function(_, _, max_lines)
						return max_lines - 15
					end,
				},
			},
		})

		local keymap = vim.keymap
		keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions, { desc = "Code actions" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find " })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Find string" })
		keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find Help" })
		keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
		-- keymap.set("n", "<leader>ccp", function()
		--   local actions = require("CopilotChat.actions")
		--   require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
		-- end, { desc = "CopilotChat - Prompt actions" })
		keymap.set(
			"n",
			"<leader>fW",
			":lua require'telescope.builtin'.live_grep{search_dirs={'%:p'}}<cr>",
			{ desc = "Find word under cursor in cwd" }
		)
	end,
}
