local lsp_installer = require 'nvim-lsp-installer'
local on_attach = require 'configs.lspconfig.on-attach'
local format_config = require 'configs.lspconfig.format'

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	virtual_text = false,
	underline = true,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })

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

local servers = {

	lua = {
		settings = {
			Lua = {
				completion = { keywordSnippet = 'Both' },
				diagnostics = {
					-- Get LSP to recognize 'vim' global
					globals = { 'vim' },
				},
				runtime = {
					version = 'LuaJIT',
					path = vim.split(package.path, ';'),
				},
				workspace = {
					library = {
						[vim.fn.expand '$VIMRUNTIME/lua'] = true,
						[vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
					},
				},
			},
		},
	},
}

-- Setup servers
lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
	}
	if server.name == 'lua' then
		opts.completion = { keywordSnippet = 'Both' }
		opts.diagnostics = { globals = { 'vim' } }
		opts.runtime = {
			version = 'LuaJIT',
			path = vim.split(package.path, ';'),
		}
		opts.workspace = {
			libaray = {
				[vim.fn.expand '$VIMRUNTIME/lua'] = true,
				[vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
			},
		}
	elseif server.name == 'efm' then
		opts.init_options = {
			documentFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
		}
		opts.filetypes = vim.tbl_keys(format_config)
		opts.settings = { languages = format_config }
	end

	server:setup(opts)

	vim.cmd [[ do User LspAttachBuffers ]]
end)

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
