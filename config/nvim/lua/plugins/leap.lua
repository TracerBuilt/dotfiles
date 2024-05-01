return {
	'ggandor/leap.nvim',
	dependencies = { 'tpope/vim-repeat' },
	config = function()
		local wk = require 'which-key'

		wk.register {
			s = { '<Plug>(leap)', 'Leap', mode = 'n' },
			S = { '<Plug>(leap-from-window)', 'Leap from window', mode = 'n' },
		}

		wk.register {
			s = { '<Plug>(leap-forward)', 'Leap forward', mode = { 'x', 'o' } },
			S = { '<Plug>(leap-backward)', 'Leap backward', mode = { 'x', 'o' } },
		}
	end,
}
