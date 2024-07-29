return {
	'folke/edgy.nvim',
	opts = function(_, opts)
		table.remove(opts.bottom, 1)
	end,
}
