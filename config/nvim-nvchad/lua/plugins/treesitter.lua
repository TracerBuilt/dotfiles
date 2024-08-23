return {

	{
		'nvim-treesitter/nvim-treesitter',
		version = false,
		build = ':TSUpdate',
		lazy = vim.fn.argc(-1) == 0, -- load early if opening file from command line
		opts = function(_, opts)
			opts.highlight = { enable = true }
			opts.indent = { enable = true }
			opts.ensure_installed = {
				'bash',
				'c',
				'diff',
				'css',
				'go',
				'html',
				'hyprlang',
				'javascript',
				'jsdoc',
				'jsonc',
				'lua',
				'luadoc',
				'luap',
				'markdown',
				'markdown_inline',
				'printf',
				'python',
				'query',
				'regex',
				'rust',
				'scss',
				'svelte',
				'toml',
				'tsx',
				'typescript',
				'vim',
				'vimdoc',
				'xml',
				'yaml',
			}
			opts.auto_install = true
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		event = 'VeryLazy',
		opts = {},
	},
}
