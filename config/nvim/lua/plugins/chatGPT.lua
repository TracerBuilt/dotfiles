return {
	'jackMort/ChatGPT.nvim',
	event = 'VeryLazy',
	config = function()
		require('chatgpt').setup {
			api_key_cmd = 'echo -n ""',
			api_host_cmd = 'echo -n http://10.75.7.7:8080',
		}
	end,
	dependencies = {
		'MunifTanjim/nui.nvim',
		'nvim-lua/plenary.nvim',
		'folke/trouble.nvim',
		'nvim-telescope/telescope.nvim',
	},
}
