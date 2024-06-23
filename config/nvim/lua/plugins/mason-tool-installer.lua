return {
	'whoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	config = function()
		require('mason-tool-installer').setup {
			ensure_installed = {
				'css-lsp',
				'eslint-lsp',
				'eslint_d',
				'firefox-debug-adapter',
				'html-lsp',
				'htmx-lsp',
				'json-lsp',
				'lemminx',
				'lua-language-server',
				'prettier',
				'prettierd',
				'prisma-language-server',
				'python-lsp-server',
				'rust-analyzer',
				'selene',
				'stylelint-lsp',
				'stylua',
				'svelte-language-server',
				'tailwindcss-language-server',
				'taplo',
				'typescript-language-server',
				'typos-lsp',
				'vim-language-server',
				'yaml-language-server',
			},
		}
	end,
}
