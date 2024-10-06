return {
  "smoka7/hop.nvim",
  keys = {
    {
      ",",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("hop").hint_words()
      end,
      mode = { "n", "x", "o" },
    },
    {
      "s",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("hop").hint_char2()
      end,
      mode = { "n", "x", "o" },
    },
    {
      "f",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
        })
      end,
      mode = { "n", "x", "o" },
    },
    {
      "F",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
        })
      end,
      mode = { "n", "x", "o" },
    },
  },
  opts = {
    multi_windows = true,
    keys = "htnsueoaidgcrlypmbkjvx",
    uppercase_labels = true,
  },
}
