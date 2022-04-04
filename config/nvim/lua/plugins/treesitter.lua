require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'html',
		'css',
		'scss',
		'javascript',
		'typescript',
		'tsx',
		'svelte',
		'graphql',
		'toml',
		'json',
		'yaml',
		'lua',
	},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = false,
		disable = {},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},
	rainbow = {
		enable = true,
		max_file_lines = nil,
	},
}

vim.o.foldlevel = 100
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
