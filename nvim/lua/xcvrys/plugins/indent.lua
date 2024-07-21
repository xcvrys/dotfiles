return {
  "echasnovski/mini.indentscope",
  opts = {
    symbol = "·",
  },
  init = function()
    -- Helper functinn to check the current buffer's filetype:
    -- :lua print(vim.bo.filetype)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "mason", "undotree" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
