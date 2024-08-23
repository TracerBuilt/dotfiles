return {
	'ThePrimeagen/refactoring.nvim',
	opts = {},
	keys = {
		{
			'<leader>re',
			function()
				require('refactoring').refactor 'Extract Function'
			end,
			desc = 'Extract function',
			mode = 'x',
		},
		{
			'<leader>rf',
			function()
				require('refactoring').refactor 'Extract Function To File'
			end,
			desc = 'Extract function to file',
			mode = 'x',
		},
		{
			'<leader>rv',
			function()
				require('refactoring').refactor 'Extract Variable'
			end,
			desc = 'Extract function',
			mode = 'x',
		},
		-- Extract variable supports only visual mode
		{
			'<leader>rI',
			function()
				require('refactoring').refactor 'Inline Function'
			end,
			desc = 'Inline function',
			mode = 'n',
		},
		-- Inline func supports only normal
		{
			'<leader>ri',
			function()
				require('refactoring').refactor 'Inline Variable'
			end,
			desc = 'Inline variable',
			mode = { 'n', 'x' },
		},
		-- Inline var supports both normal and visual mode

		{
			'<leader>rb',
			function()
				require('refactoring').refactor 'Extract Block'
			end,
			desc = 'Extract block',
			mode = 'n',
		},
		{
			'<leader>rB',
			function()
				require('refactoring').refactor 'Extract Block To File'
			end,
			desc = 'Extract block to file',
			mode = 'n',
		},
		-- Extract block supports only normal mode
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
	},
}
