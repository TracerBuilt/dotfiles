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
vim.o.completeopt = 'menuone,noselect'

-- Search
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.mousemodel = 'popup'

-- Spacing
vim.o.autoindent = true
vim.o.expandtab = false
vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.smartindent = true
vim.o.breakindent = true

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Detect alternative file types
vim.cmd [[
	if exists("did_load_filetypes") 
		finish
	endif
	augroup filetypedetect
		au! BufRead,BufNewFile *.mdx setfiletype markdown
		au! BufRead,BufNewFile *.svx setfiletype markdown
	  au! BufRead,BufNewFile .prettierrc setfiletype json
	  au! BufRead,BufNewFile .stylelintrc setfiletype json
	  au! BufRead,BufNewFile .eslintrc setfiletype json
	  au! BufRead,BufNewFile .babelrc setfiletype json
	augroup END
]]
