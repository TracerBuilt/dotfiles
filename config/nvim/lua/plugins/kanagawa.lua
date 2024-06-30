return {
	'rebelot/kanagawa.nvim',
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,

		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = 'none',
					},
				},
			},
		},
		overrides = function(colors)
			-- local theme = colors.theme
			return {
				NormalFloat = { bg = 'none' },
				FloatBorder = { bg = 'none' },
				FloatTitle = { bg = 'none' },
				NoiceLspProgressSpinner = { bg = 'none' },
				NoiceLspProgressTitle = { bg = 'none' },
				NoiceLspProgressClient = { bg = 'none' },
			}
		end,
	},
}
