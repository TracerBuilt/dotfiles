local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.tsx.used_by = { 'javascript', 'typescript.tsx' }

parser_configs.norg = {
	install_info = {
		url = 'https://github.com/nvim-neorg/tree-sitter-norg',
		files = { 'src/parser.c', 'src/scanner.cc' },
		branch = 'main',
	},
}

require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = false,
		disable = {},
	},
	ensure_installed = {
		'javascript',
		'typescript',
		'tsx',
		'css',
		'scss',
		'svelte',
		'lua',
		'toml',
		'json',
		'yaml',
		'html',
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
}

vim.cmd [[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
]]
