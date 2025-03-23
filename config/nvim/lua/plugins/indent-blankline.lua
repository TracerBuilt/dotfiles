return {
	'lukas-reineke/indent-blankline.nvim',
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = {
			char = '┆',
			tab_char = '┆',
		},

		scope = {
			enabled = true,
			char = '│',
			tab_char = '│',
			highlight = {
				'RainbowDelimiterRed',
				'RainbowDelimiterOrange',
				'RainbowDelimiterYellow',
				'RainbowDelimiterGreen',
				'RainbowDelimiterCyan',
				'RainbowDelimiterBlue',
				'RainbowDelimiterViolet',
			},
			show_start = true,
		},
	},
	dependencies = {
		{
			'HiPhish/rainbow-delimiters.nvim',
			event = 'VeryLazy',
		},
	},
}
