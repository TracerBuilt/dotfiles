return {
	'olimorris/codecompanion.nvim',
	init = function()
		vim.cmd [[cab cc CodeCompanion]]
	end,
	opts = {
		adapters = {
			openrouter = function()
				return require('codecompanion.adapters').extend('openai_compatible', {
					env = {
						url = 'https://openrouter.ai/api',
						api_key = 'OPENROUTER_API_KEY',
						chat_url = '/v1/chat/completions',
					},
					schema = {
						model = {
							default = 'openrouter/sonoma-sky-alpha',
						},
					},
				})
			end,
		},

		strategies = {
			chat = {
				adapter = 'openrouter',
				tools = {
					opts = {
						default_tools = {
							'',
						},
					},
				},
				opts = {
					---Decorate the user message before it's sent to the LLM
					---@param message string
					---@param adapter CodeCompanion.Adapter
					---@param context table
					---@return string
					prompt_decorator = function(message, adapter, context)
						return string.format([[<prompt>%s</prompt>]], message)
					end,
				},
			},
			inline = {
				adapter = 'openrouter',
			},
		},

		display = {
			chat = {
				show_settings = true,
			},
		},

		extensions = {
			mcphub = {
				callback = 'mcphub.extensions.codecompanion',
				opts = {
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
			history = {
				enabled = true,
				picker = 'snacks',
			},
		},
	},

	keys = {

		{
			'<leader>a',
			'<cmd>CodeCompanionChat Toggle<cr>',
			desc = 'Toggle Chat buffer',
			mode = { 'n', 'v' },
			noremap = true,
			silent = true,
		},
		{
			'<C-a>',
			'<cmd>CodeCompanionActions<cr>',
			desc = 'Open CodeCompanion Action Palette',
			mode = { 'n', 'v' },
			noremap = true,
			silent = true,
		},
		{
			'ga',
			'<cmd>CodeCompanionChat Add<cr>',
			mode = 'v',
			desc = 'Add to Current Chat Buffer',
			noremap = true,
			silent = true,
		},
	},

	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		{
			'MeanderingProgrammer/render-markdown.nvim',
			ft = { 'markdown', 'codecompanion' },
		},
		{
			'echasnovski/mini.diff',
			config = function()
				local diff = require 'mini.diff'
				diff.setup {
					-- Disabled by default
					source = diff.gen_source.none(),
				}
			end,
		},
		{
			'HakonHarnes/img-clip.nvim',
			opts = {
				filetypes = {
					codecompanion = {
						prompt_for_file_name = false,
						template = '[Image]($FILE_PATH)',
						use_absolute_path = true,
					},
				},
			},
		},
		'ravitemer/mcphub.nvim',
		'ravitemer/codecompanion-history.nvim',
		-- {
		-- 	'Davidyz/VectorCode',
		-- 	version = '*', -- optional, depending on whether you're on nightly or release
		-- 	build = 'pipx upgrade vectorcode', -- optional but recommended. This keeps your CLI up-to-date.
		-- 	dependencies = { 'nvim-lua/plenary.nvim' },
		-- },
	},
}
