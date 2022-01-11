local null_ls = require 'null-ls'
local b = null_ls.builtins
local on_attach = require 'configs.lspconfig.on-attach'

null_ls.setup {
	debug = true,
	format = true,
	diagnostics_format = '#{c} #{m} - #{s}',
	sources = {
		b.diagnostics.proselint.with {
			filetypes = { 'markdown', 'text', 'svx', 'mdx' },
		},
		b.formatting.prettier.with {
			filetypes = {
				'svelte',
				'javascript',
				'javascriptreact',
				'typescript',
				'typescriptreact',
				'vue',
				'css',
				'scss',
				'less',
				'html',
				'json',
				'yaml',
				'markdown',
				'graphql',
			},
		},
		b.formatting.stylua,
		b.diagnostics.codespell,
		b.formatting.codespell,
		b.code_actions.gitsigns,
	},
}
