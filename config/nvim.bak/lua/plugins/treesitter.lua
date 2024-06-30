return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup {

			ensure_installed = {
				'bash',
				'css',
				'html',
				'javascript',
				'json',
				'lua',
				'markdown',
				'markdown_inline',
				'regex',
				'rust',
				'scss',
				'svelte',
				'toml',
				'tsx',
				'typescript',
				'vim',
				'yaml',
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
