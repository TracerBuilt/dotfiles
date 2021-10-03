local lspconfig = require 'lspconfig'
local lspinstall = require 'lspinstall'
local on_attach = require 'configs.lspconfig.on-attach'
local format_config = require 'configs.lspconfig.format'

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	underline = true,
})

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
local function setup_servers()
	lspinstall.setup()
	local installed = lspinstall.installed_servers()
	for _, server in pairs(installed) do
		local config = servers[server] or {}
		config.capabilities = capabilities
		config.on_attach = on_attach
		lspconfig[server].setup(config)
	end
end

require('lspconfig').efm.setup {
	init_options = {
		documentFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
	},
	filetypes = vim.tbl_keys(format_config),
	on_attach = on_attach,
	settings = { languages = format_config },
}

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require('lspinstall').post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd 'bufdo e'
end

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 200
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
