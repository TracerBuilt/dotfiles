return {
	recommended = true,

	{
		'supermaven-inc/supermaven-nvim',
		event = 'InsertEnter',
		keys = { '<Tab>' },
		config = function()
			require('supermaven-nvim').setup {
				disable_keymaps = true,
			}

			local suggestion = require 'supermaven-nvim.completion_preview'
			vim.keymap.set('i', '<Tab>', suggestion.on_accept_suggestion, { noremap = true, silent = true })
			vim.keymap.set('i', '<c-j>', suggestion.on_accept_suggestion_word, { noremap = true, silent = true })
			vim.keymap.set('i', '<c-e>', suggestion.on_dispose_inlay, { remap = true, silent = true })
		end,
	},
	{
		'nvim-cmp',
		opts = function(_, opts)
			table.insert(opts.sources, 1, { name = 'supermaven', group_index = 1, priority = 100 })
		end,
		dependencies = { 'supermaven-inc/supermaven-nvim' },
	},
}
