return {
	'folke/edgy.nvim',
	opts = {
		bottom = {
			{
				ft = 'lazyterm',
				title = 'Terminal',
				size = { height = 0.3 },
				filter = function(buf)
					return not vim.b[buf].lazyterm_cmd
				end,
			},
		},
	},
}
