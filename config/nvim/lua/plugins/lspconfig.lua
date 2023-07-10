local lspconfig = require 'lspconfig'
require 'plugins.mason'
require('mason-lspconfig').setup()

local on_attach = function(client)
	if client.name ~= 'null-ls' then
		require('illuminate').on_attach(client)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
	end
end

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
lspconfig.astro.setup(opts)
lspconfig.jdtls.setup(opts)

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.lua_ls.setup {
	opts,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT)
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
}
lspconfig.vimls.setup(opts)

require('fidget').setup()

require 'plugins.null-ls'

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
