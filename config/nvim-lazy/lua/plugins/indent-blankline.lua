return {
	'lukas-reineke/indent-blankline.nvim',
	opts = function(_, opts)
		local highlight = {
			'RainbowRed',
			'RainbowYellow',
			'RainbowBlue',
			'RainbowOrange',
			'RainbowGreen',
			'RainbowViolet',
			'RainbowCyan',
		}
		local hooks = require 'ibl.hooks'
		local palette = require('kanagawa.colors').setup().palette
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, 'RainbowRed', { fg = palette.autumnRed })
			vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = palette.surimiOrange })
			vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = palette.boatYellow2 })
			vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = palette.autumnGreen })
			vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = palette.waveAqua1 })
			vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = palette.crystalBlue })
			vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = palette.oniViolet })
		end)

		vim.g.rainbow_delimiters = { highlight = highlight }

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

		opts.indent = {
			char = '┆',
			tab_char = '┆',
		}

		opts.scope = {
			char = '▏',
			highlight = highlight,
		}
	end,
	dependencies = {
		'HiPhish/rainbow-delimiters.nvim',
	},
}
