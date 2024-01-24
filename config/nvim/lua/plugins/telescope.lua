require('telescope').setup {
	defaults = {
		layout_strategy = 'flex',
		scroll_strategy = 'cycle',
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = 'smart_case',
		},
	},
	pickers = {
		lsp_references = { theme = 'cursor' },
		lsp_definition = { theme = 'cursor' },
		lsp_impl_definition = { theme = 'cursor' },
		buffers = {
			sort_lastused = true,
		},
	},
}
