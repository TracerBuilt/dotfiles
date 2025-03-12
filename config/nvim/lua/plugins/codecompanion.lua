return {
	'olimorris/codecompanion.nvim',
	keys = {
		{
			'<C-a>',
			'<cmd>CodeCompanionActions<cr>',
			mode = { 'n', 'v' },
			desc = 'CodeCompanion Actions',
		},
		{
			'<Leader>a',
			'<cmd>CodeCompanionChat Toggle<cr>',
			mode = { 'n', 'v' },
			desc = 'CodeCompanion Chat',
		},
		{
			'ga',
			'<cmd>CodeCompanionChat Add<cr>',
			mode = { 'v' },
			desc = 'Add to CodeCompanion Chat',
		},
	},
	init = function()
		vim.cmd [[cab cc CodeCompanion]]
	end,
	opts = {
		strategies = {
			chat = {
				adapter = 'openrouter_deepseek_r1_zero',
			},
			inline = {
				adapter = 'openrouter_deepseek_r1_zero',
			},
		},
		adapters = {
			openrouter_deepseek_r1_zero = function()
				return require('codecompanion.adapters').extend('openai_compatible', {
					env = {
						url = 'https://openrouter.ai/api',
						api_key = 'OPENROUTER_API_KEY',
						chat_url = '/v1/chat/completions',
					},
					schema = {
						model = {
							default = 'deepseek/deepseek-r1-zero:free',
						},
					},
				})
			end,
			gemini = function()
				return require('codecompanion.adapters').extend('gemini', {
					schema = {
						model = {
							default = 'gemini-2.0-flash',
						},
					},
				})
			end,
		},
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
	},
}
