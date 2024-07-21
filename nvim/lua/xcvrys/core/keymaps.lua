vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set({ "n", "i", "v", "t" }, "<F1>", "<nop>", { silent = true })

keymap.set("n", "<leader>cb", "<cmd>bd<CR>", { desc = "Close buffer" })

keymap.set("n", "<leader>cB", ":BufferLineCloseOthers<cr>", { desc = "Close all buffers" })

vim.api.nvim_set_keymap("n", "<M-z>", ":lua toggle_wrap()<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("SaveWithoutFormatting", function()
  vim.cmd("noautocmd write")
end, {})
