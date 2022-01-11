local lsp_installer = require 'nvim-lsp-installer'
local on_attach = require 'configs.lspconfig.on-attach'

local border = {
	{ '🭽', 'FloatBorder' },
	{ '▔', 'FloatBorder' },
	{ '🭾', 'FloatBorder' },
	{ '▕', 'FloatBorder' },
	{ '🭿', 'FloatBorder' },
	{ '▁', 'FloatBorder' },
	{ '🭼', 'FloatBorder' },
	{ '▏', 'FloatBorder' },
}

-- LSP settings (for overriding per client)
local handlers = {
	['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		virtual_text = false,
		underline = true,
		update_in_insert = false,
	}),
	['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	},
}

-- Setup servers
lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	}
	if server.name == 'tsserver' then
		opts.init_options = require('nvim-lsp-ts-utils').init_options
	end
	if server.name == 'eslint' then
		opts.filetypes = {
			'svelte',
			'javascript',
			'javascriptreact',
			'javascript.jsx',
			'typescript',
			'typescriptreact',
			'typescript.tsx',
			'vue',
		}
	end
	if server.name == 'sumneko_lua' then
		opts.settings = {
			Lua = {
				completion = { keywordSnippet = 'Both' },
				diagnostics = { globals = { 'vim' } },
				runtime = {
					version = 'LuaJIT',
					path = vim.split(package.path, ';'),
				},
				workspace = {
					libaray = {
						[vim.fn.expand '$VIMRUNTIME/lua'] = true,
						[vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
					},
				},
			},
		}
	end
	if server.name == 'stylelint_lsp' then
		opts.filetypes = {
			'css',
			'less',
			'scss',
			'sugarss',
			'svelte',
			'vue',
			'wxss',
			'javascript',
			'javascriptreact',
			'typescript',
			'typescriptreact',
		}
		opts.settings = {
			autoFixOnFormat = true,
		}
	end
	server:setup(opts)

	vim.cmd [[ do User LspAttachBuffers ]]
end)

require 'configs.lspconfig.null-ls'

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
