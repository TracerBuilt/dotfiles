return {
	'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
	opts = {},
	config = function()
		require('ibl').setup {
			indent = {
				char = '┆',
				tab_char = '┆',
			},
			scope = {
				char = '▏',
			},
		}
	end,
}
