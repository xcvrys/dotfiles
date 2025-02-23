-- Function to toggle line wrapping
function _G.toggle_wrap()
	vim.wo.wrap = not vim.wo.wrap
	print("Line wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
end
