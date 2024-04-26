return {
	'sindrets/diffview.nvim',
	config = function()
		local wk = require 'which-key'

		wk.register {
			name = 'Git diff',
			['<Leader>g'] = {
				b = { '<cmd>DiffviewFileHistory<CR>', 'Diff current branch' },
				f = { '<cmd>DiffviewFileHistory %<CR>', 'Diff current file' },
			},
		}
	end,
}
