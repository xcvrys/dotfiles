-- Function to toggle line wrapping
function _G.toggle_wrap()
	vim.wo.wrap = not vim.wo.wrap
	print("Line wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
end

-- Function to yank the entire buffer
function _G.yank_all()
	local pos = vim.api.nvim_win_get_cursor(0) -- Save current cursor position
	vim.cmd("normal! ggVG") -- Visual select the entire buffer
	vim.cmd('normal! "+y') -- Yank selection to the system clipboard
	vim.api.nvim_win_set_cursor(0, pos) -- Restore cursor position
end

local help_window_group = vim.api.nvim_create_augroup("help_window_right", { clear = true })

-- Move help windows to the right
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = help_window_group,
	pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
		end
	end,
})

local help_close_group = vim.api.nvim_create_augroup("HelpClose", { clear = true })

-- Close help with 'q'
vim.api.nvim_create_autocmd("FileType", {
	group = help_close_group,
	pattern = "help",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", { noremap = true, silent = true })
	end,
})

vim.api.nvim_create_augroup("RemoveCR", { clear = true })

-- Remove ^M characters on file save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "RemoveCR",
	pattern = "*",
	callback = function()
		if vim.fn.search("\\r", "w") ~= 0 then
			vim.cmd([[%s/\r\+$//g]])
		end
	end,
})
