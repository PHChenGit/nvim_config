vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Display
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.colorcolumn = "100"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split behavior
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Mouse
opt.mouse = "a"

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Folds (using treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Misc
opt.showmode = false  -- lualine shows mode
opt.pumheight = 10
opt.fileencoding = "utf-8"
opt.cmdheight = 1
opt.conceallevel = 0
opt.showtabline = 2
opt.laststatus = 3  -- global statusline
