return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local configs = require 'nvim-treesitter.configs'

		configs.setup {

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
	end,
}
