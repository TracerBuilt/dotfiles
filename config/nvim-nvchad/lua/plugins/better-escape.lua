return {
	'max397574/better-escape.nvim',
	event = 'VeryLazy',
	opts = {
		default_mappings = false,
		mappings = {
			i = {
				j = {
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
