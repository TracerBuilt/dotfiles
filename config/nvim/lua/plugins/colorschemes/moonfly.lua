local g = vim.g

g.moonflyTransparent = 1
g.moonflyCursorColor = 1
g.moonflyNormalFloat = 1

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'single',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
	border = 'single',
})

vim.cmd 'colorscheme moonfly'

vim.cmd [[highlight VertSplit guibg=NONE]]
vim.cmd [[highlight EndOfBuffer guifg=#000000 guibg=NONE]]
vim.cmd [[highlight StatusLineNC guibg=NONE]]
