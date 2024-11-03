vim.filetype.add({ extension = { ["http"] = "http" } })

return {
	"mistweaverco/kulala.nvim",
	config = function()
		local kulala = require("kulala")
		kulala.setup()

		vim.keymap.set(
			"n",
			"<leader>rq",
			kulala.run,
			{ noremap = true, silent = true, desc = "Run the current buffer as a HTTP request" }
		)
		vim.keymap.set(
			"n",
			"<leader>ra",
			kulala.run_all,
			{ noremap = true, silent = true, desc = "Run all HTTP requests in the current buffer" }
		)
	end,
}
