local o = vim.opt

vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ async = true })
  vim.notify("Formatted 👌")
end, {})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.autoindent = true
o.smartindent = true
o.hlsearch = false
o.backup = false
o.scrolloff = 10
o.shell = "fish"
o.swapfile = false
o.backupskip = { "/tmp/*", "/private/tmp/*" }
o.ignorecase = true
o.smarttab = true
o.breakindent = true
o.shiftwidth = 2
o.tabstop = 2
o.wrap = false
o.backspace = { "start", "eol", "indent" }
o.path:append({ "**" }) -- Finding files - Search down into subfolders
o.splitbelow = false
o.splitright = true
o.number = true
o.relativenumber = true
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"

o.clipboard:append({ "unnamed", "unnamedplus" })
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- ignore files vim doesnt use
o.wildignore:append({ "*/node_modules/*" })
o.wildignore:append(".git,.hg,.svn")
o.wildignore:append(".aux,*.out,*.toc")
o.wildignore:append(".o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class")
o.wildignore:append(".ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp")
o.wildignore:append(".avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg")
o.wildignore:append(".mp3,*.oga,*.ogg,*.wav,*.flac")
o.wildignore:append(".eot,*.otf,*.ttf,*.woff")
o.wildignore:append(".doc,*.pdf,*.cbr,*.cbz")
o.wildignore:append(".zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb")
o.wildignore:append(".swp,.lock,.DS_Store,._*")
