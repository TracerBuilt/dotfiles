return {
	'bluz71/vim-moonfly-colors',
	name = 'moonfly',
	lazy = true,
	config = function()
		vim.g.moonflyTransparent = 1
		vim.g.moonflyCursorColor = 1
		vim.g.moonflyNormalFloat = 1

		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' },
		})
		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
			border = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' },
		})
		vim.diagnostic.config { float = { border = 'single' } }

		vim.cmd [[highlight VertSplit guibg=NONE]]
		vim.cmd [[highlight EndOfBuffer guifg=NONE guibg=NONE]]
		vim.cmd [[highlight StatusLineNC guibg=NONE]]
	end,
}
