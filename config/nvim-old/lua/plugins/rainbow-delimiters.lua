return {
	'HiPhish/rainbow-delimiters.nvim',
	config = function()
		require('rainbow-delimiters.setup').setup {

			highlight = {
				'RainbowDelimiterViolet',
				'RainbowDelimiterBlue',
				'RainbowDelimiterCyan',
				'RainbowDelimiterGreen',
				'RainbowDelimiterYellow',
				'RainbowDelimiterOrange',
				'RainbowDelimiterRed',
			},
		}
	end,
}
