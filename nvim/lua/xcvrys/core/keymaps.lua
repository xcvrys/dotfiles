vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height

keymap.set({ "n", "i", "v", "t" }, "<F1>", "<nop>", { silent = true })

keymap.set("n", "<leader>cb", "<cmd>bd<CR>", { desc = "Close buffer" })

keymap.set("n", "<leader>cB", ":BufferLineCloseOthers<CR>", { desc = "Close all buffers" })

vim.api.nvim_set_keymap("n", "<M-z>", ":lua toggle_wrap()<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("SaveWithoutFormatting", function()
  vim.ui.select({ "tabs", "spaces" }, {
    prompt = "Select tabs or spaces:",
    format_item = function(item)
      return "I'd like to choose " .. item
    end,
  }, function(choice)
    if choice == "spaces" then
      vim.o.expandtab = true
    else
      vim.o.expandtab = false
    end
  end)
  vim.cmd("noautocmd write")
end, {})

vim.api.nvim_set_keymap("n", "<S-y>", ":lua yank_all()<CR>", { noremap = true, silent = true })

vim.keymap.set("x", "p", "P", { silent = true })
