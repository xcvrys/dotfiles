return {
	"gelguy/wilder.nvim",
	config = function()
		local wilder = require("wilder")
		local gradient = {
			"#e0def4",
			"#f6c177",
			"#ebbcba",
			"#9ccfd8",
			"#ebbcba",
			"#f6c177",
			"#e0def4",
			"#f6c177",
			"#ebbcba",
			"#9ccfd8",
			"#ebbcba",
			"#f6c177",
			"#e0def4",
		}
		for i, fg in ipairs(gradient) do
			gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
		end

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				left = { " " },
				right = { " " },
				border = "rounded",
				empty_message = wilder.popupmenu_empty_message({
					message = "No matches",
				}),
				min_width = 30,
				highlights = {
					gradient = gradient,
					border = "WilderBorder",
				},
				highlighter = wilder.highlighter_with_gradient({
					wilder.basic_highlighter(),
				}),
			}))
		)

		wilder.set_option("use_python_remote_plugin", 0)

		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					fuzzy = 1,
				}),
				wilder.vim_search_pipeline()
			),
		})

		wilder.setup({ modes = { ":", "/", "?" } })
	end,
}
