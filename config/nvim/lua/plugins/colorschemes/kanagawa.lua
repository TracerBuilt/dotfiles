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
						bg_gutter = 'NONE',
					},
				},
			},
		},
		overrides = function(colors)
			local theme = colors.theme
			local palette = colors.palette

			return {
				-- Transparent floating windows
				NormalFloat = { bg = 'NONE' },
				FloatBorder = { bg = 'NONE' },
				FloatTitle = { bg = 'NONE' },
				NoiceLspProgressSpinner = { bg = 'NONE' },
				NoiceLspProgressTitle = { bg = 'NONE' },
				NoiceLspProgressClient = { bg = 'NONE' },

				-- Dark completion (popup) menu
				Pmenu = { fg = theme.ui.shade0, bg = 'NONE' }, -- add `blend = vim.o.pumblend` to enable transparency
				PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },

				CmpItemAbbrDeprecated = { fg = theme.syn.deprecated, strikethrough = true },

				CmpItemKindCodeium = { fg = palette.waveAqua2 },
			}
		end,
	},
}
