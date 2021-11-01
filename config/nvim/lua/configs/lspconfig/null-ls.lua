local null_ls = require 'null-ls'
local b = null_ls.builtins
local on_attach = require 'configs.lspconfig.on-attach'

local sources = {
	b.diagnostics.eslint_d,
	b.diagnostics.stylelint.with({
		filetypes = {
			'css',
			'scss',
			'sass',
			'less',
			'svelte',
			'javascriptreact',
			'typescriptreact',
		},
	}),
	b.formatting.prettierd,
	b.formatting.eslint_d,
	b.formatting.stylelint.with({
		filetypes = {
			'css',
			'scss',
			'sass',
			'less',
			'svelte',
			'javascriptreact',
			'typescriptreact',
		},
	}),
	b.formatting.stylua,
}

null_ls.config {
	debug = true,
	format = true,
	diagnostics_format = '#{c} #{m} - #{s}',
	sources = sources,
}

require('lspconfig')['null-ls'].setup {
	on_attach = on_attach,
}
