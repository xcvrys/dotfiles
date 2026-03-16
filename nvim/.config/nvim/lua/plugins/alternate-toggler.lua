return {
	"rmagatti/alternate-toggler",
	event = { "BufReadPost" },
	opts = {
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
			["open"] = "close",
			["start"] = "stop",
			["let"] = "const",
			["+"] = "-",
			["==="] = "!==",
		},
	},
	keys = {
		{
			"<leader>cl",
			function()
				require("alternate-toggler").toggleAlternate()
			end,
			desc = "Toggle alternate",
		},
	},
}
