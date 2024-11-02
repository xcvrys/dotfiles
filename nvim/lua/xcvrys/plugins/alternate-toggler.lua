return {
	"rmagatti/alternate-toggler",
	event = { "BufReadPost" },
	config = function()
		require("alternate-toggler").setup({
			alternates = {
				["=="] = "!=",
				["yes"] = "no",
				["true"] = "false",
				["on"] = "off",
				["up"] = "down",
				["top"] = "bottom",
				["enable"] = "disable",
				["enabled"] = "disabled",
				["show"] = "hide",
				["visible"] = "invisible",
				["open"] = "close",
				["start"] = "stop",
				["next"] = "previous",
				["forward"] = "back",
				["push"] = "pop",
				["create"] = "destroy",
				["begin"] = "end",
				["first"] = "last",
				["in"] = "out",
				["inside"] = "outside",
				["success"] = "failure",
				["succeed"] = "fail",
				["succeeds"] = "fails",
				["succeeded"] = "failed",
				["passing"] = "failing",
				["succeeding"] = "failing",
				["let"] = "const",
				["+"] = "-",
				["==="] = "!==",
			},
		})

		vim.keymap.set(
			"n",
			"<leader>cl",
			"<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
			{ desc = "Toggle alternate" }
		)
	end,
}
