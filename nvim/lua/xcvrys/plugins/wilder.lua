return {
  "gelguy/wilder.nvim",
  config = function()
    local wilder = require("wilder")
    local gradient = {
      "#b8b4d0",
      "#9CABCA",
      "#7E9CD8",
      "#9CABCA",
      "#b8b4d0",
      "#9CABCA",
      "#7E9CD8",
      "#9CABCA",
      "#b8b4d0",
      "#9CABCA",
      "#7E9CD8",
      "#9CABCA",
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
