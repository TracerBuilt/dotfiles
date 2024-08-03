return {
	'folke/tokyonight.nvim',
	lazy = true,
	config = function()
		require('tokyonight').setup {
			style = 'night',
			transparent = true,
		}
	end,
}
