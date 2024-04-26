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
				'vim',
				'regex',
				'bash',
				'markdown',
				'markdown_inline',
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
