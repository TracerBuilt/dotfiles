require('nvim-treesitter.configs').setup {

	ensure_installed = {
		'html',
		'css',
		'scss',
		'javascript',
		'typescript',
		'tsx',
		'svelte',
		'toml',
		'json',
		'yaml',
		'lua',
	},

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},

	autotag = {
		enable = true,
	},
}
