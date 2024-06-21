vim.g.mapleader = ' '

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
vim.o.signcolumn = 'auto:1-2'
vim.o.list = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.cursorline = false

-- Global status bar
vim.o.laststatus = 3

-- Search
vim.o.hlsearch = true
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

vim.o.mousemoveevent = true

vim.diagnostic.config {
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = ' ',
			[vim.diagnostic.severity.WARN] = ' ',
			[vim.diagnostic.severity.INFO] = ' ',
			[vim.diagnostic.severity.HINT] = '󰌵',
		},
	},
	underline = true,
	severity_sort = true,
}

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

-- Disable ruby and perl providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
