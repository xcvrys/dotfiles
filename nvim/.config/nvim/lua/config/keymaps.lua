-- Disable F1 key in all modes
vim.keymap.set({ "n", "i", "v", "t" }, "<F1>", "<nop>", { silent = true })
