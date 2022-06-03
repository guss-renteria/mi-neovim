local set = vim.opt
local o = vim.o

set.syntax = 'on'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

set.number = true
set.relativenumber = true
set.numberwidth = 1

set.mouse = 'a'
set.wrap = false
set.hidden = true
set.showcmd = true
set.showmatch = true
set.cursorline = true
set.ignorecase = true
set.incsearch = true
set.updatetime = 250
set.spelllang = {'en', 'es'}
set.termguicolors = true

set.expandtab = true
set.shiftwidth = 2
set.softtabstop = 2
set.laststatus = 2

set.errorbells = false
set.backup = false
set.writebackup = false
set.showmode = false
set.swapfile = false

set.splitbelow = true
set.splitright = true

vim.cmd 'highlight ColoColumn ctermbg=0 guibg=lightgrey'

o.shell = '/bin/sh'
o.clipboard = 'unnamedplus'
o.history = 1000
o.lazyredraw = true


-- * plugins
require('zero.config.onedark')
require('zero.config.lsp')
require('zero.config.cmp-nvim')
require('zero.config.nvim-tree')
require('zero.config.bufferline')
require('zero.config.lualine')
require('zero.config.dashboard')
require('zero.config.nvim-comment')
require('zero.config.auto-pairs')
require('zero.config.indentline')
require('zero.config.treesitter')
