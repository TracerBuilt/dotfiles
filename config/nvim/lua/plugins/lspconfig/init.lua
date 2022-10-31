local lspconfig = require 'lspconfig'
local on_attach = require 'plugins.lspconfig.on-attach'
require 'plugins.mason'
require('mason-lspconfig').setup()

-- LSP settings (for overriding per client)
local handlers = {
	['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		virtual_text = false,
		underline = true,
		update_in_insert = false,
	}),
	['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
	['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local opts = {
	capabilities = capabilities,
	on_attach = on_attach,
	handlers = handlers,
}

lspconfig.html.setup(opts)
lspconfig.cssls.setup { opts, settings = {
	css = {
		lint = {
			unknownAtRules = 'ignore',
		},
	},
} }
lspconfig.tsserver.setup(opts)
lspconfig.eslint.setup(opts)
lspconfig.svelte.setup(opts)
lspconfig.jsonls.setup(opts)
lspconfig.tailwindcss.setup(opts)
lspconfig.stylelint_lsp.setup(opts)
lspconfig.rust_analyzer.setup(opts)
lspconfig.sumneko_lua.setup {
	opts,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
}
lspconfig.vimls.setup(opts)

require 'plugins.lspconfig.null-ls'

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
