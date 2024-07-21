-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Highlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 100 })
  end,
})

function _G.toggle_wrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    print("Line wrap disabled")
  else
    vim.wo.wrap = true
    print("Line wrap enabled")
  end
end
