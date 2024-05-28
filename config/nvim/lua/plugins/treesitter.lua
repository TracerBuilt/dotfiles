return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
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
				'vim',
				'regex',
				'bash',
				'markdown',
				'markdown_inline',
			},

			auto_install = true,

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},
		}
	end,
}
