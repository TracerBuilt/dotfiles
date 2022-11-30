local null_ls = require 'null-ls'
local b = null_ls.builtins

null_ls.setup {
	diagnostics_format = '#{m} - #{s}: #{c}',
	sources = {
		b.diagnostics.proselint.with {
			extra_filetypes = { 'svx', 'mdx' },
		},
		b.diagnostics.selene,
		b.formatting.prettier.with {
			extra_filetypes = { 'svelte', 'xhtml' },
			prefer_local = 'node_modules/.bin',
		},
		b.formatting.stylua,
		b.diagnostics.codespell,
		b.formatting.stylelint,
		b.code_actions.shellcheck,
		b.diagnostics.shellcheck,
		b.formatting.shellharden,
		b.formatting.shfmt
	},
}
