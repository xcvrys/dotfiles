-- Clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- Split window vertically
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- Equalize split sizes

-- Disable F1 key in all modes
vim.keymap.set({ "n", "i", "v", "t" }, "<F1>", "<nop>", { silent = true })

-- Buffer management
vim.keymap.set("n", "<leader>cb", "<cmd>bd<CR>", { desc = "Close buffer" }) -- Close current buffer
vim.keymap.set("n", "<leader>cB", ":BufferLineCloseOthers<CR>", { desc = "Close all other buffers" }) -- Close all other buffers

-- Toggle line wrapping
vim.keymap.set("n", "<M-z>", ":lua toggle_wrap()<CR>", { noremap = true, silent = true })

-- Save without formatting command
vim.api.nvim_create_user_command("SaveWithoutFormatting", function()
	-- Default to using tabs when saving
	vim.o.expandtab = false -- Always use tabs
	vim.cmd("noautocmd write") -- Save without triggering any autocommands
end, { desc = "Save without formatting" })

-- Yank all command
vim.keymap.set("n", "<S-y>", ":lua yank_all()<CR>", { noremap = true, silent = true })
