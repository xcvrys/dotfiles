return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	-- enabled = false,
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-l>",
				},
			},
			filetypes = {
				["."] = true,
				-- sh = function()
				-- 	if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
				-- 		return true
				-- 	end
				-- 	return false
				-- 	-- d
				-- end,
			},
		})
	end,
}