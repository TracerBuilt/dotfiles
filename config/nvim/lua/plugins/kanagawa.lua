return {
	'rebelot/kanagawa.nvim',
	lazy = false,
	priority = 1000,
	opts = {

		transparent = false,

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
			local theme = colors.theme
			local palette = colors.palette

			return {
				-- Transparent floating windows
				NormalFloat = { bg = 'none' },
				FloatBorder = { bg = 'none' },
				FloatTitle = { bg = 'none' },
				NoiceLspProgressSpinner = { bg = 'none', blend = 0 },
				NoiceLspProgressTitle = { bg = 'none', blend = 0 },
				NoiceLspProgressClient = { bg = 'none', blend = 0 },

				-- Dark completion (popup) mennone
				Pmenu = { fg = theme.ui.shade0, bg = 'none' }, -- add `blend = vim.o.pumblend` to enable transparency
				PmenuSel = { fg = 'none', bg = theme.ui.bg_p2 },

				-- Save an hlgroup with dark background and dimmed foreground
				-- so that you can use it where your still want darker windows.
				-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
				NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

				-- Popular plugins that open floats will link to NormalFloat by default;
				-- set their background accordingly if you wish to keep them dark and borderless
				LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

				RainbowDelimiterRed = { fg = palette.autumnRed },
				RainbowDelimiterOrange = { fg = palette.surimiOrange },
				RainbowDelimiterYellow = { fg = palette.boatYellow2 },
				RainbowDelimiterGreen = { fg = palette.autumnGreen },
				RainbowDelimiterCyan = { fg = palette.waveAqua1 },
				RainbowDelimiterBlue = { fg = palette.crystalBlue },
				RainbowDelimiterViolet = { fg = palette.oniViolet },
			}
		end,
	},
}
