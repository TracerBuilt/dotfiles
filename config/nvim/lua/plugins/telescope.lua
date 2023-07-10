require('telescope').setup {
	defaults = {
		layout_strategy = 'flex',
		scroll_strategy = 'cycle',
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false
			},
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

