local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append({ "unnamed", "unnamedplus" })

-- split windows
opt.splitright = true
opt.splitbelow = false

-- turn off swapfile
opt.swapfile = false

opt.scrolloff = 10
opt.isfname:append("@-@")

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- opt.shortmess:append("I")

vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildignore:append({ ".javac", "node_modules", "*.pyc" })
vim.opt.wildignore:append({ ".aux", ".out", ".toc" })
vim.opt.wildignore:append({
  ".o",
  ".obj",
  ".dll",
  ".exe",
  ".so",
  ".a",
  ".lib",
  ".pyc",
  ".pyo",
  ".pyd",
  ".swp",
  ".swo",
  ".class",
  ".DS_Store",
  ".git",
  ".hg",
  ".orig",
})
vim.opt.suffixesadd:append({ ".rs" }) -- search for suffexes using gf
