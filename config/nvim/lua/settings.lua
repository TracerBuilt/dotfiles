local o = vim.o

-- Colors
o.termguicolors = true

-- Basics
o.number = true
o.relativenumber = true
o.hidden = true
o.encoding = 'utf-8'
o.mouse = 'a'
o.wrap = true
o.linebreak = true
o.undofile = true
o.hlsearch = true
o.updatetime = 500
o.timeoutlen = 1000
o.list = true
o.clipboard = 'unnamedplus'

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.mousemodel = 'popup'

-- Spacing
o.autoindent = true
o.expandtab = false
o.tabstop = 3
o.shiftwidth = 3
o.smartindent = true

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
