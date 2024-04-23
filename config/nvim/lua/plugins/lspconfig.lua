local lspconfig = require 'lspconfig'
require 'plugins.mason'
require('mason-lspconfig').setup { automatic_installation = true }

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local opts = {
	capabilities = capabilities,
}

lspconfig.typos_lsp.setup(opts)
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
lspconfig.rust_analyzer.setup(opts)
lspconfig.jdtls.setup(opts)
lspconfig.lemminx.setup(opts)
lspconfig.stylelint_lsp.setup {
	opts,
	filetypes = { 'css', 'scss', 'less', 'pcss', 'svelte' },
	settings = {
		stylelintplus = {
			autoFixOnSave = true,
		},
	},
}

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

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
