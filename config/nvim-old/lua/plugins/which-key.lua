return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		operators = {
			gc = 'Comment Linewise',
			gb = 'Comment Blockwise',
			ys = 'Surround',
			yS = 'Surround Line',
		},
	},
}
