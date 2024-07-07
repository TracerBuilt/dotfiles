return {
	'supermaven-inc/supermaven-nvim',
	lazy = false,
	keys = { '<Tab>' },
	config = function()
		require('supermaven-nvim').setup {
			disable_keymaps = true,
		}

		local suggestion = require 'supermaven-nvim.completion_preview'
		vim.keymap.set(
			'i',
			'<Tab>',
			suggestion.on_accept_suggestion,
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			'i',
			'<c-j>',
			suggestion.on_accept_suggestion_word,
			{ noremap = true, silent = true }
		)
		vim.keymap.set('i', '<c-]>', suggestion.on_dispose_inlay, { noremap = true, silent = true })
	end,
}
