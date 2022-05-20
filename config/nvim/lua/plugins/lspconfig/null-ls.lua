local null_ls = require 'null-ls'
local b = null_ls.builtins

null_ls.setup {
	diagnostics_format = '#{m} - #{s}: #{c}',
	sources = {
		b.diagnostics.proselint.with {
			extra_filetypes = { 'svx', 'mdx' },
		},
		b.diagnostics.luacheck,
		b.formatting.prettier.with {
			extra_filetypes = { 'svelte', 'xhtml' },
		},
		b.formatting.stylua,
		b.diagnostics.codespell,
		b.formatting.codespell,
		b.formatting.stylelint,
	},
}
