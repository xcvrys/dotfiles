local o = vim.opt

vim.g.mapleader = " "

o.number = true
o.relativenumber = true
o.cursorline = true

o.autoindent = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"

o.backup = false

o.clipboard:append({ "unnamed", "unnamedplus" })

o.path:append({ "**" })
o.wildignore:append({ "*/node_modules/*" })

o.splitbelow = false
o.splitright = true

o.scrolloff = 10

o.wrap = false

o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.python3_host_prog = os.getenv("HOME") .. "/.venv/nvim/bin/python3"
