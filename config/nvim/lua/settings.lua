vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Colors
vim.o.termguicolors = true

-- Basics
vim.wo.number = true
vim.o.relativenumber = true
vim.o.hidden = true
vim.o.encoding = 'utf-8'
vim.o.mouse = 'a'
vim.o.wrap = true
vim.o.linebreak = true
vim.opt.undofile = true
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.timeoutlen = 1000
vim.o.list = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.cursorline = false

-- Global status bar
vim.o.laststatus = 3

-- Search
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.mousemodel = 'popup'

-- Spacing
vim.o.autoindent = true
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.breakindent = true

vim.o.title = true

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Proper indentation for YAML
vim.cmd [[ autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab ]]
vim.cmd [[ autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab ]]

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
