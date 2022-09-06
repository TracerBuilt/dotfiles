vim.opt.list = true

require('indent_blankline').setup {
	buftype_exclude = { 'terminal' },
	char = '┆',
	filetype_exclude = { '', 'help', 'packer', 'NvimTree', 'nofile', 'mason' },
	char_highlight_list = {
		'IndentBlankline1',
		'IndentBlankline2',
		'IndentBlankline3',
		'IndentBlankline4',
		'IndentBlankline5',
		'IndentBlankline6',
		'IndentBlankline7'
	},
	show_current_context = true,
	show_current_context_start = true,
	use_treesitter = true,
}
