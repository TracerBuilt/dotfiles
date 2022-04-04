vim.opt.list = true

require('indent_blankline').setup {
	buftype_exclude = { 'terminal' },
	char = '┆',
	filetype_exclude = { '', 'help', 'packer', 'NvimTree', 'nofile', 'lsp-installer' },
	char_highlight_list = {
		'IndentBlankline',
	},
	show_current_context = true,
	show_current_context_start = true,
	context_highlight_list = {
		'IndentBlanklineContext',
	},
	show_first_indent_level = true,
	use_treesitter = true,
}
