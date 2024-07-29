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

				TelescopeBorder = { bg = 'none', blend = vim.o.pumblend },
				TelescopeTitle = { bg = 'none', bold = true, blend = vim.o.pumblend },
				-- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
				-- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
				-- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
				-- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
				-- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
				-- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

				CmpItemAbbrDeprecated = { fg = theme.syn.deprecated, strikethrough = true },

				CmpItemKindCodeium = { fg = palette.waveAqua2 },
			}
		end,
	},
}
