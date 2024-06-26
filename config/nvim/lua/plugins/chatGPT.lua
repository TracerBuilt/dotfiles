return {
	'jackMort/ChatGPT.nvim',
	event = 'VeryLazy',
	config = function()
		require('chatgpt').setup {
			api_host_cmd = 'echo -n http://localhost:8080',
		}
	end,
	dependencies = {
		'MunifTanjim/nui.nvim',
		'nvim-lua/plenary.nvim',
		'folke/trouble.nvim',
		'nvim-telescope/telescope.nvim',
	},
}
