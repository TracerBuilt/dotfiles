local null_ls = require 'null-ls'
local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup {
	diagnostics_format = '#{m} - #{s}: #{c}',
	on_attach = function(client, bufnr)
		if client.supports_method 'textDocument/formatting' then
			vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
	sources = {
		b.diagnostics.proselint.with {
			extra_filetypes = { 'svx', 'mdx' },
		},
		b.diagnostics.selene,
		b.formatting.prettier.with {
			extra_filetypes = { 'svelte', 'toml' },
		},
		b.formatting.stylua,
		b.formatting.stylelint.with {
			extra_filetypes = { 'svelte' },
		},
		b.formatting.shellharden,
		b.formatting.shfmt,
	},
}
