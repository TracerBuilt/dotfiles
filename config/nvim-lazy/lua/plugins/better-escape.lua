return {
	'max397574/better-escape.nvim',
	event = 'VeryLazy',
	opts = {
		mappings = {
			i = {
				j = {
					-- These can all also be functions
					k = '<Esc>',
				},
			},
			c = {
				j = {
					k = '<Esc>',
				},
			},
			t = {
				j = {
					k = '<Esc>',
				},
			},
			v = {
				j = {
					k = '<Esc>',
				},
			},
			s = {
				j = {
					k = '<Esc>',
				},
			},
		},
	},
	config = function(_, opts)
		require('better_escape').setup(opts)
	end,
}
