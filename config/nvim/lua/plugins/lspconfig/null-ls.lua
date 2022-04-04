local null_ls = require 'null-ls'
local b = null_ls.builtins

null_ls.setup {
	debug = true,
	format = true,
	diagnostics_format = '#{c} #{m} - #{s}',
	sources = {
		b.diagnostics.proselint.with {
			extra_filetypes = { 'svx', 'mdx' },
		},
		b.diagnostics.luacheck,
		b.formatting.prettierd.with {
			extra_filetypes = { 'svelte' },
		},
		b.formatting.stylua,
		b.diagnostics.codespell,
		b.formatting.codespell,
		b.formatting.stylelint.with {
			extra_filetypes = { 'svelte' },
		},
	},
}
