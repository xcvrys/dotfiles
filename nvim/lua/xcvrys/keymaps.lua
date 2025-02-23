-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- Split window vertically
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- Equalize split sizes

-- Disable F1 key in all modes
vim.keymap.set({ "n", "i", "v", "t" }, "<F1>", "<nop>", { silent = true })

-- Toggle line wrapping
vim.keymap.set("n", "<M-z>", ":lua toggle_wrap()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
