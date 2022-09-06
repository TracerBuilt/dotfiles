local null_ls = require 'null-ls'
local b = null_ls.builtins

null_ls.setup {
	diagnostics_format = '#{m} - #{s}: #{c}',
	sources = {
		b.diagnostics.proselint.with {
			extra_filetypes = { 'svx', 'mdx' },
		},
		b.diagnostics.selene,
		b.formatting.prettierd.with {
			extra_filetypes = { 'svelte', 'xhtml' },
			prefer_local = 'node_modules/.bin',
		},
		b.formatting.stylua,
		b.diagnostics.codespell,
		b.formatting.stylelint,
		b.code_actions.shellcheck,
		b.diagnostics.shellcheck.with {
			extra_filetypes = { 'zsh' }
		},
		b.formatting.shellharden,
		b.formatting.shfmt
	},
}
