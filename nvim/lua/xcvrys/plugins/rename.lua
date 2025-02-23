return {
	"saecki/live-rename.nvim",
	config = function()
		local rename = require("live-rename")

		vim.keymap.set("n", "<leader>r", rename.rename, { desc = "LSP rename" })

		-- the following are equivalent
		vim.keymap.set("n", "<leader>R", rename.map({ text = "", insert = true }), { desc = "LSP rename" })
	end

}
