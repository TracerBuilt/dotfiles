local surround_mappings = {

	add = 'gsa',
	delete = 'gsd',
	replace = 'gsr',
	find = 'gsf',
	find_left = 'gsF',
	highlight = 'gsh',
	update_n_lines = 'gsn',
}

return {
	{
		'echasnovski/mini.ai',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'echasnovski/mini.operators',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'echasnovski/mini.surround',
		event = 'VeryLazy',
		keys = {
			{ surround_mappings.add, desc = 'Add surrounding', mode = { 'n', 'v' } },
			{ surround_mappings.delete, desc = 'Delete surrounding' },
			{ surround_mappings.replace, desc = 'Replace surrounding' },
			{ surround_mappings.find, desc = 'Find surrounding' },
			{ surround_mappings.find_left, desc = 'Find left surrounding' },
			{ surround_mappings.highlight, desc = 'Highlight surrounding' },
			{ surround_mappings.update_n_lines, desc = 'Update n lines' },
		},
		opts = {
			mappings = surround_mappings,
		},
	},
}
