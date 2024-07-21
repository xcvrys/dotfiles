return {
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("tailwind-tools").setup({
      document_color = {
        enabled = false,
      },
      conceal = {
        enabled = true,
        min_length = 80,
        symbol = "󱏿",
        highlight = {
          fg = "#38BDF8",
        },
      },
    })
    vim.keymap.set("n", "<leader>st", "<cmd>:TailwindSort<cr>", { noremap = true, silent = true })
  end,
}
