return {
	'ggandor/leap.nvim',
	config = function()
		local wk = require 'which-key'

		wk.register {
			s = {
				function()
					require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
				end,
				'Leap',
			},
		}
	end,
}
