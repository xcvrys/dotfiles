-- Initialize Vim options
local opt = vim.opt

-- LEADER KEY CONFIGURATION
vim.g.mapleader = " "

-- EDITOR SETTINGS
opt.number = true          
opt.relativenumber = true  
opt.cursorline = true

-- TABS & INDENTATION SETTINGS
opt.autoindent = true     
opt.smartindent = true   
opt.tabstop = 2         
opt.shiftwidth = 2     
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- CLIPBOARD SETTINGS
opt.clipboard:append({"unnamed", "unnamedplus"})    

-- ENCODING SETTINGS
opt.encoding = "utf-8"    
opt.fileencoding = "utf-8"

-- SEARCH SETTINGS
opt.hlsearch = true        -- Highlight matches during search
opt.ignorecase = true      -- Case insensitive searching unless /C or capital letter in search
opt.smarttab = true        -- Insert tabs correctly when hitting Tab in insert mode

-- BACKUP AND TEMP SETTINGS
opt.backup = false       
opt.backupskip = { "/tmp/*", "/private/tmp/*" } -- Skip backup for files in these directories

-- DISPLAY SETTINGS
opt.scrolloff = 10         -- Keep 10 lines visible above and below the cursor
opt.wrap = false           -- Disable line wrapping
opt.breakindent = true     -- Enable break indent for wrapped lines

-- BACKSPACE BEHAVIOR
opt.backspace = { "start", "eol", "indent" } -- Allow backspacing over everything in insert mode

-- PATH AND WILDCARD SETTINGS
opt.path:append({ "**" })  -- Allow searching in subdirectories
opt.wildignore:append({ "*/node_modules/*" }) -- Ignore node_modules in file searches

-- SPLIT WINDOW BEHAVIOR
opt.splitbelow = false     
opt.splitright = true     

-- UNDO
opt.undodir = os.getenv("HOME").. "/.vim/undodir"
opt.undofile = true
