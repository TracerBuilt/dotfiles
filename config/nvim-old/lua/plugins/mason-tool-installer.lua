return {
	'whoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	config = function()
		require('mason-tool-installer').setup {
			ensure_installed = {
				'eslint_d',
				'firefox-debug-adapter',
				'prettier',
				'prettierd',
			},
		}
	end,
}
