return {
	'rcarriga/nvim-dap-ui',
	dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
	config = function()
		require('dapui').setup()

		local wk = require 'which-key'

		wk.register {
			['<leader>d'] = {
				name = 'Debug',
				u = { '<cmd>lua require"dapui".toggle()<CR>', 'Toggle UI' },
				b = { '<cmd>lua require"dap".toggle_breakpoint()<CR>', 'Toggle Breakpoint' },
			},
		}
	end,
}
