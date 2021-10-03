vim.opt.list = true

require('indent_blankline').setup {
	buftype_exclude = { 'terminal', 'nofile' },
	char = '┆',
	char_highlight_list = {
		'IndentBlanklineIndent1',
		'IndentBlanklineIndent2',
		'IndentBlanklineIndent3',
		'IndentBlanklineIndent4',
		'IndentBlanklineIndent5',
		'IndentBlanklineIndent6',
	},
	filetype_exclude = { 'help', 'packer' },
	show_first_indent_level = true,
	use_treesitter = true,
}
