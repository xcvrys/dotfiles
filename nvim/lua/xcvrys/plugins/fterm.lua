return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      border = "rounded",
      -- cmd = "ll",
    })

    vim.api.nvim_set_keymap("n", "<A-t>", "<CMD>lua require('FTerm').toggle()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      "t",
      "<A-t>",
      "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
