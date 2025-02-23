local HEADERS_ANIMATED = {
	"01_30x30-10.txt",
	"02_30x30-10.txt",
	"03_38x30-10.txt",
	"04_44x30-40.txt",
	"05_30x30-10.txt",
	"06_30x30-10.txt",
	"07_30x30-10.txt",
	"08_30x30-10.txt",
	"09_30x30-10.txt",

	"11_30x30-10.txt",
	"13_25x30-10.txt",
	"15_30x30-10.txt",
	"16_30x30-10.txt",
	"17_30x30-10.txt",
	"18_30x30-10.txt",
	"19_30x30-10.txt",
	"20_29x30-10.txt",

	"24_30x30-10.txt",
	"25_30x30-10.txt",
	"27_29x30-10.txt",

	"31_30x30-10.txt",
	"35_30x30-10.txt",
	"36_30x30-10.txt",
	"37_30x30-10.txt",
	"38_27x30-10.txt",
	"39_65x30-10.txt",
	"40_65x30-10.txt",

	"42_26x30-10.txt",
	"43_60x30-10.txt",
	"46_72x30-10.txt",
	"48_24x30-10.txt",
	"50_30x30-10.txt",
	"51_29x30-10.txt",
	"52_23x30-10.txt",
}


math.randomseed(os.time())
local idx = math.random(1, #HEADERS_ANIMATED)
local info = HEADERS_ANIMATED[idx]
local base_path = os.getenv("HOME") .. "/.config/nvim/lua/xcvrys/animations/"
local img_width, img_height = string.match(info, "_(%d+)x(%d+)")

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		amiate = { enabled = true },
		bigfile = { enabled = true },
		dashboard = {
			row = nil, -- dashboard position. nil for center
			col = nil, -- dashboard position. nil for center
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				}
			},
			sections = {
				{
					section = "terminal",
					width = tonumber(img_width) * 2,
					height = tonumber(img_height) + 2,
					cmd = "bash " .. base_path .. "show.sh " .. base_path .. info
				},
				{
					section = "keys",
					gap = 1,
					padding = 1,
				},
				{ section = "startup" },
			},
		},
		explorer = {
			enabled = true,
		},
		indent = {
			enabled = true,
			indent = {
				only_scope = true,
			},
			animate = { enabled = true },
		},
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		terminal = {
			win = {
				style = 'terminal',
				position = 'float',
				border = 'rounded',
			},
		},
		picker = {
			sources = {
				explorer = {
					layout = {
						layout = { position = "right" },
					},
					auto_close = true,
					diagnostics = true,
					diagnostics_open = true,
					git_status = true,
					git_status_open = true,
					follow_file = true,
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},
	keys = {
		-- Top Pickers & Explorer
		{ "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
		{ "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
		{ "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
		{ "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
		{ "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
		-- find
		{ "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
		{ "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
		{ "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
		{ "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
		{ "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
		{ "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
		-- git
		{ "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
		{ "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
		{ "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
		{ "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
		{ "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
		{ "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
		{ "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
		-- Grep
		{ "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
		{ "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
		{ "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
		{ "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
		-- Search
		{ '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
		{ '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
		{ "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
		{ "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
		{ "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
		{ "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
		{ "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
		{ "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
		{ "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
		{ "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
		{ "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
		{ "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
		{ "<leader>sK",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
		{ "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
		{ "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
		{ "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
		{ "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
		{ "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
		{ "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
		{ "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
		{ "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
		-- LSP
		{ "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
		{ "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
		{ "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
		{ "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
		{ "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
		{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
		{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
		-- Other
		{ "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
		{ "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
		{ "<leader>.",       function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
		{ "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
		{ "<leader>n",       function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
		{ "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
		{ "<leader>bD",      function() Snacks.bufdelete.other() end,                                desc = "Delete All Buffers" },
		{ "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
		{ "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",               mode = { "n", "v" } },
		{ "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
		{ "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
		{ "<A-t>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal",          mode = { "n" } },
		{ "<A-t>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal",          mode = { "t" } },
		{ "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
		{ "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
					"<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
