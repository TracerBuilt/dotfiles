-- return {}

return {
	'nvimdev/lspsaga.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	event = 'LspAttach',
	config = function()
		require('lspsaga').setup {
			symbol_in_winbar = {
				enable = false,
			},
			code_action = {
				enable = true,
				sign = true,
				extend_gitsigns = true,
			},
		}
	end,
}
