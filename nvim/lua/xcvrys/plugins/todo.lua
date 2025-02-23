return {
	"folke/todo-comments.nvim",
	lazy = false,
	opts = {},
	keys = {
		{ "<leader>t", function() Snacks.picker.todo_comments() end, desc = "Todo comments" },
	}
}
