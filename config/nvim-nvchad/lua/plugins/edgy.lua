return {
	'folke/edgy.nvim',
	opts = {
		bottom = {
			{
				ft = 'lazyterm',
				title = 'Terminal',
				size = { height = 0.4 },
				filter = function(buf)
					return not vim.b[buf].lazyterm_cmd
				end,
			},
		},
	},
}
