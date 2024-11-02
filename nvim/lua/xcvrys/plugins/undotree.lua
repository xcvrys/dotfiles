return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_WindowLayout = 4
		vim.g.undotree_ShortIndicators = 1
		vim.g.undotree_DiffAutoOpen = 1
		vim.g.undotree_SetFocusWhenToggle = 1

		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Open Undo Tree" })
		vim.keymap.set("n", "<F2>", vim.cmd.UndotreeToggle, { desc = "Open and focus Undo Tree" })
	end,
}
