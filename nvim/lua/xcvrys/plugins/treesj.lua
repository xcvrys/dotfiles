return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufRead", "BufNewFile" },
  config = function()
    vim.keymap.set("n", "<leader>m", function()
      require("treesj").toggle()
    end, { desc = "Toggle tree" })
    vim.keymap.set("n", "<leader>M", function()
      require("treesj").toggle({ split = { recursive = true } })
    end, { desc = "Toggle tree recursively" })
  end,
}
