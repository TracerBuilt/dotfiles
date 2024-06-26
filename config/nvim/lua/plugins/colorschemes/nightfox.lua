return {
	'EdenEast/nightfox.nvim',
	lazy = true,
	config = function()
		require('nightfox').setup {
			transparent = true,
			terminal_colors = true,
		}
	end,
}
