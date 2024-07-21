return {
  "chrisgrieser/nvim-chainsaw",
  opts = {
    marker = "[LOG]",
  },
  keys = {
    {
      "<leader>lv",
      function()
        require("chainsaw").variableLog()
      end,
      desc = "Log variable",
    },
    {
      "<leader>lt",
      function()
        require("chainsaw").timeLog()
      end,
      desc = "Log time",
    },
    {
      "<leader>lo",
      function()
        require("chainsaw").objectLog()
      end,
      desc = "Log object",
    },
  },
}
