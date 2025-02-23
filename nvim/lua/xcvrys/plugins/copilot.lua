return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require('copilot').setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
			},
			filetypes = {
				["."] = true,
				sh = function()
					if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
						return false
					end
					return true
				end,
			},
			copilot_node_command = 'node', -- Node.js version must be > 18.x
		})
	end,
}
