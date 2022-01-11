require('indent_blankline').setup {
	buftype_exclude = { 'terminal' },
	char = '┆',
	--[[ char_highlight_list = {
		'IndentBlanklineIndent1',
		'IndentBlanklineIndent2',
		'IndentBlanklineIndent3',
		'IndentBlanklineIndent4',
		'IndentBlanklineIndent5',
		'IndentBlanklineIndent6',
	}, ]]
	filetype_exclude = { 'help', 'packer', 'NvimTree', 'nofile', 'lsp-installer' },
	show_first_indent_level = true,
	use_treesitter = true,
}
