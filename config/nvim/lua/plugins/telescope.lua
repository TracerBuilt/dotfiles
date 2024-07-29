return {
	'nvim-telescope/telescope.nvim',
	opts = function(_, opts)
		opts.defaults.borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
		opts.defaults.winblend = nil
	end,
}
