-- set leader remap before anything else
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indents
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

--
opt.completeopt = "menu,menuone,noselect"
